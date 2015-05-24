class MessageWorker
  # with great power comes great responsability. please handle with care.
  TWILIO_NUMBER = '5218153509504'
  TWILIO_ACCOUNT_SID = 'AC8d52061961139162598aecad2b6868f0'
  TWILIO_AUTH_TOKEN = '27ca152b4fe82d0107cc1b1cf488098c'

	include Sidekiq::Worker

	def perform(message_id)
		message = Message.find(message_id)
		message.sent = true
		message.save
		twilio_number = TWILIO_NUMBER
    	client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
    	client.account.messages.create(from: twilio_number, to: message.phone_number, body: message.body)
	end
end