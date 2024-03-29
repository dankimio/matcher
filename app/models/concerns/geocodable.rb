module Geocodable
  extend ActiveSupport::Concern

  included do
    validates :latitude,
              numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 },
              allow_nil: true
    validates :longitude,
              numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 },
              allow_nil: true
  end
end
