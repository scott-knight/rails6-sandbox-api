# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  include Deviseable
  respond_to :json

  skip_before_action :verify_signed_out_user

  def destroy
    signout_user
    verify_user_is_signed_out
  end

  private

  def respond_with(resource, _opts = {})
    render json: UserSerializer.new(resource).to_hash, status: :ok
  end

  def signout_user(all_sessions: false)
    set_payload if @payload.blank?
    Warden::JWTAuth::TokenRevoker.new.call(@token)
  rescue JWT::DecodeError => e
    @error_message = {
      error: "The user doesn't appear to be signed in.
      #{add_standard_error_message_if_valid(e.message)}".squish
    }
  rescue StandardError => e
    @error_message = {
      error: "An error occured while signing the user out.
      #{add_standard_error_message_if_valid(e.message)}".squish
    }
  end

  def verify_user_is_signed_out
    if @payload.try(:dig, :jti) && !AllowlistedJwt.find_by(jti: @payload[:jti])
      render json: { message: 'successfully logged out' }, status: :ok
    else
      return render_error_message(@error_message) if @error_message
      render json: { error: 'User was NOT successfully logged out' }, status: :internal_server_error
    end
  end
end
