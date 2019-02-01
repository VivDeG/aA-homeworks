require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new("email" => "hello@world.com","password" => "good_password")
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#is_password?" do
    it "checks if the password is correct" do
      expect(user.is_password?("good_password")).to be true
    end
  end

  describe "#reset_session_token!" do
    it "resets the user's session token" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describe "::find_by_credentials" do
    it "returns the user if given valid credentials" do
      user.save!
      expect(User.find_by_credentials("hello@world.com", "good_password")).to eq(user)
    end
  end
end
