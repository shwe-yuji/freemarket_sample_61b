require 'twilio-ruby'

Twilio.configure do |config|
  config.account_sid = Rails.application.credentials[:TWILIO_SID]
  config.auth_token = Rails.application.credentials[:TWILIO_TOKEN]
end
