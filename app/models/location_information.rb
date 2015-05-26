class LocationInformation < ActiveRecord::Base

  PATTERN_TYPES = ['San Michel', 'San Andres']
  PROMO_TYPES = %w[Kitchen Closet Both]

  belongs_to :dossier

  validates :pattern, inclusion: PATTERN_TYPES
  validates :promo, inclusion: PROMO_TYPES


end
