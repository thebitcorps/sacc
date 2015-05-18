class MessageWorker
	include Sidekiq::Worker

	def perform(message_id)
		message = Message.find(message_id)
		twilio_number = ENV['TWILIO_NUMBER']
    	client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    	client.account.messages.create(from: @twilio_number, to: message.phone_number, body: message.body)
	end
end