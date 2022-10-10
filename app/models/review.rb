class Review < ApplicationRecord
  has_rich_text :content
  belongs_to :product
end
