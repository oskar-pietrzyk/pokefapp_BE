# frozen_string_literal: true

module API
  module V1
    module Users
      class Login < API::V1::Users::Base
        desc 'Login an user'

        params do
          requires :email, type: String, desc: 'Email address'
          requires :password, type: String, desc: 'Password'
        end

        after do
          header 'Authorization', @user.allowlisted_jwts.last.jti
        end

        post do
          @user = authenticate_user!(params)
          render @user
        end
      end 
    end
  end
end
