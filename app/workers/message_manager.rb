class MessageManager
  def self.reminder(time_before, appointment)
    ap_date = appointment.date
    ap_time = appointment.time
    appointment_time = Time.new(ap_date.year, ap_date.month, ap_date.day, ap_time.hour, ap_time.min)
    user = appointment.user
    client = appointment.client
    valid_number = client.main_phone
    #get best number--------------------------
    if valid_number
      message = Message.create(
        phone_number: valid_number,
        body: "Te recordamos #{client.name} que tienes una cita con #{user.name} a las #{ap_time.hour}:#{ap_time.min} saludos XOXOX",
        to_date: ap_date,
        to_time: ap_time - time_before
        )
      # scope for time now
      MessageWorker.perform_in(appointment_time - Time.now, message.id)
    end
    message = Message.create(
      phone_number: user.cellphone,
      body: "Te recordamos #{user.name} que tienes una cita con #{client.name} a las #{ap_time.hour}:#{ap_time.min} saludos XOXOX",
      to_date: ap_date,
      to_time: ap_time - time_before
      )
    # scope for Time.now
    MessageWorker.perform_in(appointment_time - Time.now, message.id)
  end
end