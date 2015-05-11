class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :user, counter_cache: true
end
