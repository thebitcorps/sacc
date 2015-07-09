class House < ActiveRecord::Base
  has_one :negociation #, -> {includes :client} some experimentation, do not delete //Rob
  has_one :client, through: :negociation
  scope :untaken, -> { includes(:negociation).where(negociations: {id: nil}) }

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

  def set_status(status)
    update_attributes(status: status)
  end
end
