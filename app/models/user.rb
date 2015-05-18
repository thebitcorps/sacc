class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable,  
  devise :database_authenticatable, :trackable, :validatable, :rememberable

  has_many :clients, class_name: "Client", foreign_key: 'current_salesman_id'
  has_many :appointments, class_name: "Appointment"
  has_many :interactions, class_name: "Interaction"
  validates :name, :maternal_lastname, :paternal_lastname,
            :email, :cellphone, :gender, presence: true

  def gender_displayname
    gender == ApplicationHelper::MALE[:value] ? ApplicationHelper::MALE[:display_name] : ApplicationHelper::FEMALE[:display_name]
  end

  def fullname
    [name, paternal_lastname, maternal_lastname].join(" ")
  end

  def today_appointments
    appointments.where(date: Date.today)
  end


end
