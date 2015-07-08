class Negociation < ActiveRecord::Base

 # "client_id", "house_id", "authorized_by", "final_price", "months", "due",
 # "signature_date", "witness1", "witness2", "done"

  belongs_to :client
  belongs_to :house

  validates :house, :client, presence: true
  def self.complete
    # correr validaciones para ver si los demás no están en blanco
    # sólo client y house son obligatorios para crear
  end

#falta un callback que cambie el estado de la casa a no disponible en cuanto se cierre la venta
# algo como self.house.taken

end
