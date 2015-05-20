class Appointment < ActiveRecord::Base
  STATUS = %w(cancelada reprogramada proxima exitosa)

  belongs_to :client
  belongs_to :user #, counter_cache: true
  validates :date,:time, presence: true

  def self.type_list
    %w[all today upcoming previous]
  end

  def self.all_from(user_id)
    where(user_id: user_id).order('date')
  end

  def self.today_from(user_id)
    where(date: Date.today,user_id: user_id).order('date')
  end

  def self.upcoming_from(user_id)
    where( "date > ? and user_id = ?" ,Date.today, user_id ).order('date')
  end

  def self.previous_from(user_id)
    where( "date < ? and user_id = ?" ,Date.today, user_id ).order('date')
  end
end
