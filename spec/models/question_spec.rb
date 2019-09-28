require 'rails_helper'

RSpec.describe Question, type: :model do
  
  describe "Validations" do
    it "is valid with valid attributes" do
      question = build(:question)
      expect(question).to be_valid
    end

    it "is not valid without content" do
      question = build(:question, content: nil)
      expect(question).to_not be_valid
    end

    it "is not valid without user_id" do
      question = build(:question, user_id: nil)
      expect(question).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many comments" do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  
    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end

end
