class Interaction < ActiveRecord::Base
  #we need to define the interaction types
  # FOO = { phone: 'md-phone', module: 'md-business', house: 'md-people', other: 'md-phone' }

  KINDS = %w[Phone Module House Appointment Other]
  KIND_ICON = { KINDS[0] => 'md-phone', KINDS[1]=> ' md-business',KINDS[2]=> ' md-people', KINDS[3] => ' md-adjust',KINDS[5] => 'md-adjust' }
  KIND_COLOR = { KINDS[0] => 'green', KINDS[1]=> 'teal',KINDS[2]=> ' orange', KINDS[3] => ' red',KINDS[4] => ' yellow' }

  belongs_to :user
  belongs_to :client, counter_cache: true
  validates :kind, presence: true, inclusion: KINDS
  # validates :date, :time, :date, presence: true
  scope :from_today, -> { where("created_at::date = ?", Date.today) }

  def self.my_interactions(salesman)
    where(user: salesman)
  end

  def self.created_today(salesman)
    my_interactions(salesman).from_today
  end

  def kind_color
   KIND_COLOR[kind]
  end

  def kind_icon
    KIND_ICON[kind]
  end
end
