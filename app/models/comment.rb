class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # For adding rich text
  has_rich_text :body
end
