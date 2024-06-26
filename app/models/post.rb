class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 140 }

  validates :body, presence: true
  validates :user, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_rich_text :body

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables

  # Make it likeable
  acts_as_votable

  # Add this line to any model you want to have likes associated
  has_many :likes, as: :likeable, dependent: :destroy
end
