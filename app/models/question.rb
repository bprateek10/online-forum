class Question < ApplicationRecord

  #Associations
  belongs_to :user
  has_many :comments, as: :commentable

  #Validations
  validates :content, presence: true
end
