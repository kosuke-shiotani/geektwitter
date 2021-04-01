class Tweet < ApplicationRecord
  has_rich_text :body
  mount_uploader :file, AudiofileUploader
end
