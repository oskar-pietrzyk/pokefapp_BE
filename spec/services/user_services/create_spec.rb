# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserServices::Create, type: :service do
  subject { described_class.call(params) }

  let(:username) { 'valid' }
  let(:email) { 'valid@email.com' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  let(:params) do
    {
      username: username,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    }
  end

  describe '#call' do
    context 'when params are valid' do
      it 'increases User count' do
        expect { subject }.to change { User.count }.by(1)
      end

      it 'creates an user with proper data' do
        subject
        expect(User.last.email).to eq(params[:email])
        expect(User.last.username).to eq(params[:username])
      end
    end

    context 'when params are invalid' do
      let(:email) { 'invalid_email' }
      let(:password) { 'incorrect' }

      it 'raises ActiveRecord::RecordInvalid error message' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
