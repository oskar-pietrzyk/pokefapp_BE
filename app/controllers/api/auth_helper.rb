# frozen_string_literal: true

require 'doorkeeper/grape/helpers'

module API
  module AuthHelper
    extend ::Grape::API::Helpers
    include Doorkeeper::Grape::Helpers

    def unauthorized_error
      error!({ message: 'Not authenticated' }, 401)
    end

    def authenticate_user!
      unauthorized_error unless authenticated_user?
    end

    def authenticated_user?
      doorkeeper_token.present?
    end

    def current_user
      doorkeeper_token.present? ? doorkeeper_user : nil
    end

    def doorkeeper_user
      User.find_by(id: doorkeeper_token.resource_owner_id) || User.new
    end
  end
end
