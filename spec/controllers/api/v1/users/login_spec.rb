# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::Users::Login, type: :request do
  describe 'POST /api/v1/login' do
    subject { post '/api/v1/login', params: params }

    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }
    let(:params) do
      {
        email: email,
        password: password
      }
    end

    context 'when params are valid' do
      it 'returns proper status' do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context 'when params are invalid' do
      let(:email) { 'invalid_email' }

      it 'returns an error status' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
