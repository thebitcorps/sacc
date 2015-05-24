class Dossier < ActiveRecord::Base
  belongs_to :client
  has_one :nominal_work_record
  has_one :spouse_work_record
  has_one :object
  has_one :location_information
end
