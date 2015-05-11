class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients, :class_name => "Client", foreign_key: 'current_salesman_id'
  validates :name,:maternal_lastname,:paternal_lastname,:email,:cellphone,:gender,presence: true

  def gender_displayname
    self.gender == ApplicationHelper::MALE[:value] ? ApplicationHelper::MALE[:display_name] : ApplicationHelper::FEMALE[:display_name]
  end

  def fullname
    self.name + " " + self.paternal_lastname + " " + self.maternal_lastname
  end
end
