##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'BrandedCall' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.trusted_comms.branded_calls.create(from: 'from', to: 'to', reason: 'reason')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'From' => 'from', 'To' => 'to', 'Reason' => 'reason', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/TrustedComms/Business/BrandedCalls',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "bg_color": "#fff",
          "brand_sid": "BZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "branded_channel_sid": "BWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "business_sid": "BXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "caller": "Owl Bank",
          "created_at": "2019-05-01T20:00:00Z",
          "font_color": "#000",
          "from": "+15000000000",
          "logo": "https://www.twilio.com/marketing/bundles/company/img/logos/red/twilio-logo-red.png",
          "phone_number_sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "reason": "Hello Jhon, your appointment has been confirmed.",
          "sid": "CQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "unknown",
          "to": "+573000000000",
          "use_case": "conversational",
          "url": "https://preview.twilio.com/TrustedComms/Business/BrandedCalls"
      }
      ]
    ))

    actual = @client.preview.trusted_comms.branded_calls.create(from: 'from', to: 'to', reason: 'reason')

    expect(actual).to_not eq(nil)
  end
end