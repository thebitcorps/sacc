class Dossier < ActiveRecord::Base
  belongs_to :client
  has_one :nominal_work_record, dependent: :destroy
  has_one :spouse_work_record, dependent: :destroy
  has_one :location_information, dependent: :destroy
  has_many :documents, dependent: :destroy
end
