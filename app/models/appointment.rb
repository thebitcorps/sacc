class Appointment < ActiveRecord::Base
  STATUS = %w(upcoming successful rescheduled cancelled)
  STATUS_COLORS = %w[info success warning danger]

  COMPLETE_MESSAGES = {
      'successful' => 'How the appoitment when?',
      'did not show up' => 'Why didn\'t he show up?'
  }
  COMPLETE_STATUS = COMPLETE_MESSAGES.keys

  NO_COMPLETE_MESSAGES = {
      'cancelled' => 'Whu did he cancel?',
      'rescheduled' => 'Add the date and time picker?'
  }
  NO_COMPLETE_STATUS = NO_COMPLETE_MESSAGES.keys

  after_update :status_change_action

  def status_color
    hash = Hash[STATUS.zip STATUS_COLORS]
    hash[status]
  end

  def previous?
    date < Date.today and status == 'upcoming'
  end

  def can_reshedule?
    status == 'upcoming' and date >= Date.today
  end

  belongs_to :client, counter_cache: true
  belongs_to :user #, counter_cache: true
  validates :date, :time, presence: true

  scope :for_today, -> { where("date = ?", Date.today) }
  scope :future_date, ->(date) { where("date > ?", date) }
  scope :past_date, ->(date) { where("date < ?", date) }

  # Just an idea Jams
  def self.upcoming_from(user_id, date = Date.today)
    where(user_id: user_id, status: 'upcoming').future_date(date).order(:date)
  end

  def self.type_list
    %w[all today upcoming previous]
  end

  def self.all_from(user_id)
    where(user_id: user_id, status: 'upcoming').order('date')
  end

  # lambda for date.today
  def self.today_from(user_id)
    where(date: Date.today,user_id: user_id).order('date')
  end

  # lambda for Date.today
  def self.previous_from(user_id)
    where( "date < ? and user_id = ? and status = ?" ,Date.today, user_id ,  'upcoming').order('date')
  end

  # Params new_status= the new status to update
  # if rescheduled will create a new appoitment with the date and time params
  # if successful will create a new interaction
  def status_change_action
    if status == 'rescheduled'
      Appointment.create(client_id: self.client_id, user_id: self.user_id, date: date,
                         place: self.place, time: self.time, notes: self.notes, status: 'upcoming')
      Interaction.create(
          kind: 'Appointment', date: self.date, time: self.time, mood: 0, interest: 0, user_id: self.user_id,
          client_id: self.client_id, notes: "Appoitment reshedule - #{self.notes}", completed: false, position: 0)
    #   should cancel the last message
    elsif status == 'successful'
      Interaction.create(kind: 'Appointment', date: self.date, time: self.time, mood: 0, interest: 0, user_id: self.user_id,
          client_id: self.client_id, notes: self.notes, completed: false, position: 0)
    elsif status == 'cancelled'
      Interaction.create(kind: 'Appointment', date: self.date, time: self.time, mood: 0, interest: 0, user_id: self.user_id,
                         client_id: self.client_id, notes: self.notes, completed: false, position: 0)
    end
  end

end
