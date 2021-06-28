require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "creates a valid user if all fields are entered and passwords match" do
      @user = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyo1234"
      )

      expect(@user).to be_valid
    end

    it "returns an error if passwords do not match." do
      @user = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyyy1234"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to include("Password confirmation doesn't match Password")
    end

    it "returns an error if passwords do not match." do
      @user = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyyy1234"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to include("Password confirmation doesn't match Password")
    end

    it "returns an error if email already exists." do
      @user1 = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyo1234"
      )
      @user1.save!
      @user2 = User.new(
        name: "Joe", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyo1234"
      )
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages[0]).to include("Email has already been taken")
    end

    it "returns an error if password length is less then 8 characters." do
      @user = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo123",
        password_confirmation: "heyo123"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to include("Password is too short (minimum is 8 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
   
    it "logs in user with correct credentials" do
      @user = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyo1234"
      )
      @user.save!
      expect(User.authenticate_with_credentials("jammin@gmail.com","heyo1234")).to eq(@user)
    end
    it "logs in user with upper case email" do
      @user = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyo1234"
      )
      @user.save!
      expect(User.authenticate_with_credentials("JAMMIN@gmail.com","heyo1234")).to eq(@user)
    end
    it "logs in user with white space in email and upper case" do
      @user = User.new(
        name: "Irving", 
        email: "jammin@gmail.com",
        password: "heyo1234",
        password_confirmation: "heyo1234"
      )
      @user.save!
      expect(User.authenticate_with_credentials(" JAMMIN@gmail.com ","heyo1234")).to eq(@user)
    end
  end
end
