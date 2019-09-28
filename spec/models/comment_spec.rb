require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  describe "Validations" do
    it "is valid with valid attributes" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "is not valid without body" do
      comment = build(:comment, body: nil)
      expect(comment).to_not be_valid
    end

    it "is not valid without commentable resource" do
      comment = build(:comment, commentable_type: nil, commentable_id: nil) 
      expect(comment).to_not be_valid
    end

    it "is not valid without user" do
      comment = build(:comment, user_id: nil) 
      expect(comment).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to commentable" do
      assc = described_class.reflect_on_association(:commentable)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
  