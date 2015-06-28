class House < ActiveRecord::Base

  def self.type_list
    %w[available sold booked]
  end
  def self.available
    where(status: 'available').order('interior ASC')
  end

  def self.sold
    where(status: 'sold').order('interior ASC')
  end

  def self.booked
    where(status: 'booked').order('interior ASC')
  end
end
