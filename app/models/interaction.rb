class Interaction < ActiveRecord::Base
  #we need to define the interaction types
  KINDS = %w[Phone Module House Other]
  KIND_ICON = {KINDS[0] => ' md-phone', KINDS[1]=> ' md-business',KINDS[2]=> ' md-people', KINDS[3] => ' md-phone' }
  belongs_to :user
  belongs_to :client
  validates :kind, presence: true, inclusion: KINDS
  validates :date, :time, :date, presence: true

  def self.my_interactions(salesman)
    where(user: salesman)
  end

  def kind_icon
    KIND_ICON[kind]
  end
end
