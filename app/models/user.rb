class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  # For liking
  # acts_as_voter

  # Has many likes, if user is destroyed, destroy the likes too
  has_many :likes, dependent: :destroy
end

