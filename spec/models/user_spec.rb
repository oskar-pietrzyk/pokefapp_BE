# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { user }

  let(:user) { create(:user) }

  describe 'validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:username) }
  end
end
