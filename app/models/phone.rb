class Phone < ActiveRecord::Base

  PHONE_TYPES = %w[casa oficina celular otro]
  belongs_to :client
  validates :phone_type ,inclusion: PHONE_TYPES



end
