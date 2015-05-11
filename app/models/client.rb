class Client < ActiveRecord::Base
  MARITAL_STATUS = %w(single married widowed divorced)
  belongs_to :salesman, :class_name => "User", :foreign_key => "current_salesman_id"
  has_many :visits, :class_name => "Visit"
  has_many :phones, dependent: :destroy
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :phones,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :addresses,reject_if: :all_blank, allow_destroy: true

  def fullname
    self.name + ' ' + self.paternal_lastname + ' ' + self.maternal_lastname
  end
end
