class Interaction < ActiveRecord::Base
  #we need to define the interaction types
  KINDS = %w[Phone Module House Other]
  belongs_to :user
  belongs_to :client
  validates :kind,inclusion: KINDS
  validates :kind,:date,:time,:date, presence: true

end
