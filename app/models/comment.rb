class Comment < ApplicationRecord
  
  #Associations
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  #Validations
  validates :body, presence: true
end
