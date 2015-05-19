class Interaction < ActiveRecord::Base
  #we need to define the interaction types
  KINDS = %w[Phone Module House Other]
  belongs_to :user
  belongs_to :client
  validates :kind, presence: true, inclusion: KINDS
  validates :date, :time, :date, presence: true

  def self.my_interactions(salesman)
    where(user: salesman)
  end
end
