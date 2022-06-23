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
      user.try(:valid_password?, params[:password]) ? user : unauthorized_error
    end
  end
end
