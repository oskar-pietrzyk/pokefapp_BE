# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Users::Create, type: :request do
  describe 'POST /api/v1/users' do
    subject { post '/api/v1/users', params: params }

    context 'when params are valid' do
      let(:params) do
        {
          username: 'username',
          email: 'valid@email.com',
          password: 'password',
          password_confirmation: 'password'
        }
      end

      it 'creates an user' do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context 'when params are invalid' do
      let(:params) do
        {
          username: 'username',
          email: 'invalid',
          password: 'password',
          password_confirmation: 'password1'
        }
      end

      it 'does not create an user' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
