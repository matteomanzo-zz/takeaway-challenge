require 'rubygems'
require 'twilio-ruby'

class Text

  attr_reader :client

  def initialize
    account_sid = 'ACd6a43f53972d62b07e2600aa0152fa18'
    auth_token = '2013d2eeb583591792048efd68040231'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text!
    one_hour = 60*60
    time = Time.now + one_hour
    @client.account.sms.messages.create(
      :from => "+441524220092",
      :to =>   "+447479198894",
      :body => "Thank you! Your order was places and it will be delivered before #{time}"
    )
  end
end

text = Text.new  
text.send_text!



