class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :background, BackgroundUploader
end
