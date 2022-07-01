# frozen_string_literal: true

require 'doorkeeper/grape/helpers'

module API
  module AuthHelper
    extend ::Grape::API::Helpers
    include Doorkeeper::Grape::Helpers

    def unauthorized_error
      error!({ message: 'Not authenticated' }, 401)
    end

    def authenticate_by_token!
      unauthorized_error unless authenticated_user?
    end

    def authenticated_user?
      doorkeeper_token.present?
    end

    def authenticate_user!(params)
      user = User.find_for_authentication(email: params[:email])
      reactivate_token(user) unless active_token(user)
      
      user.try(:valid_password?, params[:password]) && active_token(user) ? user : unauthorized_error
    end

    def revoke_token_if_expired(user)
      user.allowlisted_jwts.last.exp > DateTime.now ? true : user.allowlisted_jwts.last.destroy!
    end

    def active_token(user)
      user.allowlisted_jwts.present? ? true : false
    end

    def reactivate_token(user)
      @token, payload = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
      user.on_jwt_dispatch(@token, payload)
    end
  end
end
