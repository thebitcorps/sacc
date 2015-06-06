class Appointment < ActiveRecord::Base
  STATUS = %w(upcoming successful rescheduled cancelled)

  COMPLETE_MESSAGES = {
      'successful' => 'How the appoitment when?',
      'did not show up' => 'Why didn\'t he show up?'
  }
  COMPLETE_STATUS = COMPLETE_MESSAGES.keys

  NO_COMPLETE_MESSAGES = {
      'cancel' => 'Whu did he cancel?',
      'reschedule' => 'Add the date and time picker?'
  }
  NO_COMPLETE_STATUS = NO_COMPLETE_MESSAGES.keys




  belongs_to :client, counter_cache: true
  belongs_to :user #, counter_cache: true
  validates :date, :time, presence: true

  scope :for_today, -> { where("date = ?", Date.today) }
  scope :future_date, ->(date) { where("date > ?", date) }
  scope :past_date, ->(date) { where("date < ?", date) }

  # Just an idea Jams
  def self.upcoming_from(user_id, date = Date.today)
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
