class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Associations
  has_many :questions
  has_many :comments

  #Validations
  validates :email, :first_name, :last_name, presence: true

  def name
    self.first_name + " " + self.last_name
  end
end
