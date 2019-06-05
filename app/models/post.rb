class Post < ApplicationRecord
  validates :title, 
    presence: true, 
    length: {minimum: 3, maximum: 255}, 
    uniqueness: {case_sensitive: false}
  
  validates :content,
    presence: true,
    length: {minimum: 10 }

  belongs_to :user
  has_many :cat_post, dependent: :destroy
  has_many :categories, through: :cat_post
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
