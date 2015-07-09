class Phone < ActiveRecord::Base
  KINDS = %w(house office cellphone other)
  belongs_to :client
  validates :kind, presence: true, inclusion: KINDS

end
