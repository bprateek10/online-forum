require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
    it "is valid with valid attributes" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is not valid without a password" do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without first name" do
      user = build(:user, first_name: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without last name" do
      user = build(:user, last_name: nil)
      expect(user).to_not be_valid
    end
  end

  describe "Associations" do    
    it "has many questions" do
      assc = described_class.reflect_on_association(:questions)
      expect(assc.macro).to eq :has_many
    end
  
    it "has many comments" do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end

  describe "name" do
    it "consist of first and last name" do
      user = build(:user)
      assert_equal "Bill Gates", user.name
    end
  end
  
end
