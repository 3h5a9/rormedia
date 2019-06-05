class Category < ApplicationRecord
  has_many :cat_post
  has_many :posts, through: :cat_post
end
