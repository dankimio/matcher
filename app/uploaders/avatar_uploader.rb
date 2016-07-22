class AvatarUploader < ApplicationUploader
  process resize_to_fit: [750, 750]
end
