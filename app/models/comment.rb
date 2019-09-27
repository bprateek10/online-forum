class Comment < ApplicationRecord
  
  #Associations
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user

  #Validations
  validates :body, presence: true
end
