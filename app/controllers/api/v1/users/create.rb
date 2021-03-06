# frozen_string_literal: true

module API
  module V1
    module Users
      class Create < API::V1::Users::Base
        desc 'Create a user'

        params do
          requires :username, type: String, desc: 'Username'
          requires :email, type: String, desc: 'Email address'
          requires :password, type: String, desc: 'Password'
          requires :password_confirmation, type: String, desc: 'Password confirmation'
        end

        post do
          user = UserServices::Create.call(params)
          render user
        end
      end
    end
  end
end
