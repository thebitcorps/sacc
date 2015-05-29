class Dossier < ActiveRecord::Base
  belongs_to :client
  has_one :nominal_work_record, dependent: :destroy
  has_one :spouse_work_record, dependent: :destroy
  has_one :location_information, dependent: :destroy


  accepts_nested_attributes_for :location_information
  has_one :general_check_list, dependent: :destroy
  has_one :general_spouse_check_list, dependent: :destroy


  # we should separate this models
  has_one :wage_check_list, dependent: :destroy
  has_one :natural_person_check_list, dependent: :destroy
  has_one :legal_person_check_list, dependent: :destroy
end
