class Appointment < ActiveRecord::Base
  STATUS = %w(cancelada reprogramada proxima exitosa)
  belongs_to :client
  belongs_to :user #, counter_cache: true
  validates :date,:time, presence: true
end
