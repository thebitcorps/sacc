class Client < ActiveRecord::Base
  MARITAL_STATUS = %w(single married widowed divorced)
  belongs_to :salesman, class_name: "User", foreign_key: "current_salesman_id"
  has_many :appointments, class_name: "Appointment"
  has_many :phones, dependent: :destroy
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :phones,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :addresses,reject_if: :all_blank, allow_destroy: true

  def fullname
    [name, paternal_lastname, maternal_lastname].join(" ")
  end

  def self.columns_names
    %w[name paternal_lastname maternal_lastname imss spouse mail]
  end

  def self.search(search, column)
    column = 'name' unless columns_names.include?(column)
    if search
      where("#{column} LIKE ?","%#{search}%")
    end
  end

  def self.search_by_name_or_lastname(search)
    if search and !search.empty?
      search = "#{search}%"
      where('name LIKE ? OR paternal_lastname LIKE ? OR maternal_lastname LIKE ?',search,search,search)
    else
      all
    end

  end
end
