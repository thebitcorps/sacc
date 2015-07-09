class MessageWorker
  # with great power comes great responsability. please handle with care.
  TWILIO_NUMBER = '+525549998677'
  TWILIO_ACCOUNT_SID = 'AC0f296a3534d2fbc0ace508b920f6d8ab'
  TWILIO_AUTH_TOKEN = '70e3a9af23f2ddb42d7877737a07bf0f'

	include Sidekiq::Worker

	def perform(message_id)
		message = Message.find(message_id)
		message.sent = true
		message.save
    	client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
    	client.account.messages.create(from: TWILIO_NUMBER, to: "+52#{message.phone_number}", body: message.body)
	end
end