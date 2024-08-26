require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    subject { User.new(email: 'test@example.com', password: 'password') }

    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'password encryption' do
    it 'should have a secure password' do
      user = User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to have_secure_password
    end
  end
end
