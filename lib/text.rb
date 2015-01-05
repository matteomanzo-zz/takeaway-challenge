require 'twilio-ruby'
require './ACCOUNT_SID.rb'
require './AUTH_TOKEN.rb'

class Text

	def initialize
		@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
	end

	def send!
      one_hour = 60*60
      time = Time.now + one_hour
      @client.account.sms.messages.create(
        :from => "+441524220092",
        :to =>   "+447479198894",
        :body => "Thank you! Your order was placed and will be delivered before #{time}"
      )
  end
end