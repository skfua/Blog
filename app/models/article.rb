class Article < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :title, length: {in: 4..80}
  validates :fabula, length: {in: 10..180}
  validates :text, presence: true
  validates :user_id, presence: true
  mount_uploader :image, ImageUploader
end
