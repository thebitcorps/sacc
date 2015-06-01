class Interaction < ActiveRecord::Base
  #we need to define the interaction types
  KINDS = %w[Phone Module House Other]
  KIND_ICON = {KINDS[0] => ' md-phone', KINDS[1]=> ' md-business',KINDS[2]=> ' md-people', KINDS[3] => ' md-phone' }
  belongs_to :user
  belongs_to :client, counter_cache: true
  validates :kind, presence: true, inclusion: KINDS
  validates :date, :time, :date, presence: true
  scope :from_today, -> { where("created_at = ?", Date.today) }

  def self.my_interactions(salesman)
    where(user: salesman)
  end

  def self.created_today(salesman)
    where(user: salesman).from_today
  end

  def kind_icon
    KIND_ICON[kind]
  end
end
