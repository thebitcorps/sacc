class Client < ActiveRecord::Base
  # id, name, paternal_lastname, maternal_lastname, curp, imss, 
  # spouse, birthdate, mail, income, notes, workplace, 
  # current_salesman_id, created_at, updated_at, 
  # marital_status, gender, appointments_count
  GENDER = [['Hombre', true], ['Mujer', false]]
  MARITAL_STATUS = [['Soltero', 'single'], ['Casado', 'married'], ['Viudo', 'widowed'], ['Divorciado', 'divorced']]
  CREDIT_TYPE = [['Credito Bancario', 'bank'], ['Credito Infonavit', 'infonavit'], ['Credito FOVISSSTE', 'fovissste']]
  FISCAL_ENTITY = [['Persona Asalariada', 'wage'], ['Persona Fisica', 'natural'], ['Persona Moral', 'legal']]
  belongs_to :salesman, class_name: "User", foreign_key: "current_salesman_id"
  has_many :appointments, class_name: "Appointment", dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_many :phones, dependent: :destroy
  has_one :dossier, dependent: :destroy
  scope :today, -> { where("created_at::date = ?", Date.today) }

  validates :name, :paternal_lastname, :gender, presence: true

  #validates :marital_status, inclusion: ['single', 'married', 'widowed', 'divorced']
  #validates :credit_type, inclusion: ['bank', 'infonavit', 'fovissste']
  #validates :fiscal_entity, inclusion: ['wage', 'natural', 'legal']

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  before_save :titleize_fields # before_validation?

  def fullname
    [name, paternal_lastname, maternal_lastname].join(" ")
  end

  def self.searcheable_fields
    %w[name paternal_lastname maternal_lastname spouse mail]
  end

  def self.my_clients(salesman)
    where(salesman: salesman).order('created_at DESC')
  end

  def self.created_today(salesman)
    my_clients(salesman).today
  end

  def self.search(search, column)
    column = 'name' unless searcheable_fields.include?(column)
    if search
      where("#{column} LIKE ?","%#{search}%")
    end
  end

  def self.search_by_name_or_lastname(search)
    if search and !search.empty?
      search = "%#{search.downcase}%"
      where('lower(name) LIKE ? OR lower(paternal_lastname) LIKE ? OR lower(maternal_lastname) LIKE ? OR lower(spouse) LIKE ?',search,search,search,search)
    else
      all
    end
  end

  def married?
    marital_status == 'married'
  end

  def spouse_active
    married? && spouse_works && credit_type == 'bank'
  end

  def documentize
    if dossier.nil?
      create_dossier
      dossier.create_location_information
      dossier.create_nominal_work_record
      dossier.make_checklist(credit_type, fiscal_entity, spouse_active)
    end
    dossier.create_spouse_work_record if married? && spouse_works
  end

  def update_documents
    if dossier != nil
      dossier.make_checklist(credit_type, fiscal_entity, spouse_active)
      if married? && spouse_works
        dossier.create_spouse_work_record if dossier.spouse_work_record.nil?
      else
        dossier.spouse_work_record.destroy if dossier.spouse_work_record
      end
    end
  end

  def notes
    notes  = appointments.each
  end

private

  def titleize_fields
    ['name', 'paternal_lastname', 'maternal_lastname', 'spouse'].each do |m|
      self.send("#{m}=", instance_eval(%Q{#{m}.titleize unless #{m}.nil?}))
    end
  end
end
