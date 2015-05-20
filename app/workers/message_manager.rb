class MessageManager
	def self.reminder(time_before, appointment)
		ap_date = appointment.date
		ap_time = appointment.time
		appointment_time = Time.new(ap_date.year, ap_date.month, ap_date.day, ap_time.hour, ap_time.min)
		user = appointment.user
		# For now until appointments get a client
		#client = appointment.client
		client = Client.first
		#get best number--------------------------
		if(client.phones.count == 0)
			return
		end
		message = Message.credate(
			phone_number: client.phones.first.number,
			body: "Te recordamos #{client.name} que tienes una cita con #{user.name} a las #{ap_time.hour}:#{ap_time.min} saludos XOXOX",
			to_date: ap_date,
			to_time: ap_time - time_before
			)
		MessageWorker.perform_in(appointment_time - Time.now, message.id)

		message = Message.create(
			phone_number: user.cellphone,
			body: "Te recordamos #{user.name} que tienes una cita con #{client.name} a las #{ap_time.hour}:#{ap_time.min} saludos XOXOX",
			to_date: ap_date,
			to_time: ap_time - time_before
			)
		MessageWorker.perform_in(appointment_time - Time.now, message.id)
	end
end