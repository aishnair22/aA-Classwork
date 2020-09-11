require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    FactoryBot.create(:user)
  end

  subject(:user123) do
    User.create(username: "user123", email: "user123@aa.io", password: "password")
  end

  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}

    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}

    it {should validate_length_of(:password).is_at_least(6)}
  end

  # describe "associations" do
  #   it {should have_many(:goals)}
  # end

  describe "::find_by_credentials" do
    context "finds users based on username and password" do
      it "with valid params" do
        expect(User.find_by_credentials(user.username, "password")).to eq(user)
      end
      
      it "with invalid params" do
        expect(User.find_by_credentials(user.username, "")).to eq(nil)
      end
    end
  end

  describe "#password=" do
    it "creates a setter for password_digest" do
      expect(user.password_digest).to_not be_nil
    end
    
    it "encrypts password using BCrypt" do
      #set the expectation first, and then build the user to test the expectation
      expect(BCrypt::Password).to receive(:create).with("abcdef")
      FactoryBot.build(:user, password: "abcdef")
    end
  end

  describe "#is_password?" do
    it "does not save passwords to the database" do
      FactoryBot.create(:user, username: "Harry Potter")
      user = User.find_by(username: "Harry Potter")

      # expect(user.password).not_to eq("password") --also works
      expect(user.password).to be_nil
    end

    it "checks password with password_digest" do
      expect(user.is_password?("password")).to eq(true)
    end
  end

  describe "#reset_session_token!" do
    it "resets a user's session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#ensure_session_token" do
    it "creates a session_token" do
      expect(user.session_token).to_not be_nil
    end
  end
end
