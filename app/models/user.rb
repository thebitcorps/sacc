class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients, :class_name => "Client", foreign_key: 'current_salesman_id'
  validates :name,:maternal_lastname,:paternal_lastname,:email,:cellphone,:gender,presence: true

  def gender_displayname
    self.gender == MALE[:value] ? MALE[:display_name] : FEMALE[:display_name]
  end
end
