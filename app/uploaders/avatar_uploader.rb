class AvatarUploader < ApplicationUploader
  process resize_to_fit: [500, 500]
end
