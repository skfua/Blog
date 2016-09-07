class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader
  mount_uploader :background, BackgroundUploader
end
