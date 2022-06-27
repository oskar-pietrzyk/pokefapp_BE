# frozen_string_literal: true

module API
  module V1
    module Users
      class Login < API::V1::Users::Base
        desc 'Create a user'

        params do
          requires :email, type: String, desc: 'Email address'
          requires :password, type: String, desc: 'Password'
        end

        post do
          render authenticate_user!(params)
        end
      end
    end
  end
end
