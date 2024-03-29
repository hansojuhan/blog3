class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 140 }

  validates :body, presence: true
  validates :user, presence: true

  belongs_to :user
  has_many :comments
end
