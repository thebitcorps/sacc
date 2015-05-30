class Appointment < ActiveRecord::Base
  STATUS = %w(Next Successful Rescheduled Cancelled)

  belongs_to :client
  belongs_to :user #, counter_cache: true
  validates :date,:time, presence: true

  scope :for_today, -> { where( "date = ?", Date.today) }
  scope :future_date, ->(date) { where("date >= ?", date) }
  scope :past_date, ->(date) { where("date < ?", date) }

  # Just an idea Jams
  # here we need to catch and exception in there or
  # somthing is wrong return 500 when there are no upcoming
  def self.upcoming_from(user_id, date)
    where(user_id: user_id).future_date(date).order(:date)
  end

  def self.type_list
    %w[all today upcoming previous]
  end

  def self.all_from(user_id)
    where(user_id: user_id).order('date')
  end

  def self.today_from(user_id)
    where(date: Date.today,user_id: user_id).order('date')
  end

  def self.previous_from(user_id)
    where( "date < ? and user_id = ?" ,Date.today, user_id ).order('date')
  end
end
