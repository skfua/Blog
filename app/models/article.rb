class Article < ApplicationRecord
  has_many :comments
  validates :title, length: {in: 4..65}
  validates :fabula, length: {in: 10..140}
  validates :text, presence: true
end
