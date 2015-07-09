class Negociation < ActiveRecord::Base

 # "client_id", "house_id", "authorized_by", "final_price", "months", "due",
 # "signature_date", "witness1", "witness2", "done"

  belongs_to :client
  belongs_to :house
  before_save :set_house_status

  def complete
    # correr validaciones para ver si los demás no están en blanco
  end

  def set_house_status # condition found: if house is deleted, can't change status, all clean-up can be done from controller
    house.set_status('booked') if house_id
    house.set_status('sold') if done # if done, it's sold, and takes prescendence over booking
  end
end
