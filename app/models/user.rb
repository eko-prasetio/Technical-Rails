class User < ApplicationRecord
  enum role: [:regular, :admin, :user]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true
  
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is not a valid email address' }
end
