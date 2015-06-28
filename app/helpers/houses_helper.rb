module HousesHelper

  def in_square_meters(meters)
    "#{meters.round 1} m&sup2".html_safe
  end
end
