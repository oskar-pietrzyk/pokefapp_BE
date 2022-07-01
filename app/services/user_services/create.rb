# frozen_string_literal: true

module UserServices
  class Create < ApplicationService
    def initialize(params)
      @user_params = params
    end

    def call
      user = User.new(params)
      user.save!
      @token, payload = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
      user.on_jwt_dispatch(@token, payload)

      user
    end

    private

    attr_reader :user_params

    def params
      {
        username: user_params[:username],
        email: user_params[:email],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation]
      }
    end
  end
end
