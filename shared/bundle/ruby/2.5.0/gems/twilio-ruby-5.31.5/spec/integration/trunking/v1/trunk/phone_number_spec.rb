##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'PhoneNumber' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trunking.twilio.com/v1/Trunks/TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/PhoneNumbers/PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2010-12-10T17:27:34Z",
          "date_updated": "2015-10-09T11:36:32Z",
          "friendly_name": "(415) 867-5309",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "phone_number": "+14158675309",
          "api_version": "2010-04-01",
          "voice_caller_id_lookup": null,
          "voice_url": "",
          "voice_method": "POST",
          "voice_fallback_url": null,
          "voice_fallback_method": null,
          "status_callback": "",
          "status_callback_method": "POST",
          "voice_application_sid": null,
          "trunk_sid": "TKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_url": "",
          "sms_method": "POST",
          "sms_fallback_url": "",
          "sms_fallback_method": "POST",
          "sms_application_sid": "",
          "address_requirements": "none",
          "beta": false,
          "url": "https://trunking.twilio.com/v1/Trunks/TKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "capabilities": {
              "voice": true,
              "sms": true,
              "mms": true
          },
          "links": {
              "phone_number": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
          }
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://trunking.twilio.com/v1/Trunks/TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/PhoneNumbers/PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .phone_numbers('PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .phone_numbers.create(phone_number_sid: 'PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'PhoneNumberSid' => 'PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://trunking.twilio.com/v1/Trunks/TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/PhoneNumbers',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2010-12-10T17:27:34Z",
          "date_updated": "2015-10-09T11:36:32Z",
          "friendly_name": "(415) 867-5309",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "phone_number": "+14158675309",
          "api_version": "2010-04-01",
          "voice_caller_id_lookup": null,
          "voice_url": "",
          "voice_method": "POST",
          "voice_fallback_url": null,
          "voice_fallback_method": null,
          "status_callback": "",
          "status_callback_method": "POST",
          "voice_application_sid": null,
          "trunk_sid": "TKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_url": "",
          "sms_method": "POST",
          "sms_fallback_url": "",
          "sms_fallback_method": "POST",
          "sms_application_sid": "",
          "address_requirements": "none",
          "beta": false,
          "url": "https://trunking.twilio.com/v1/Trunks/TKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "capabilities": {
              "voice": true,
              "sms": true,
              "mms": true
          },
          "links": {
              "phone_number": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
          }
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .phone_numbers.create(phone_number_sid: 'PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                         .phone_numbers.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trunking.twilio.com/v1/Trunks/TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/PhoneNumbers',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers?PageSize=1&Page=0",
              "key": "phone_numbers",
              "next_page_url": null,
              "page": 0,
              "page_size": 1,
              "previous_page_url": null,
              "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers?PageSize=1&Page=0"
          },
          "phone_numbers": [
              {
                  "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2010-12-10T17:27:34Z",
                  "date_updated": "2015-10-09T11:36:32Z",
                  "friendly_name": "(415) 867-5309",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "phone_number": "+14158675309",
                  "api_version": "2010-04-01",
                  "voice_caller_id_lookup": null,
                  "voice_url": "",
                  "voice_method": "POST",
                  "voice_fallback_url": null,
                  "voice_fallback_method": null,
                  "status_callback": "",
                  "status_callback_method": "POST",
                  "voice_application_sid": null,
                  "trunk_sid": "TKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sms_url": "",
                  "sms_method": "POST",
                  "sms_fallback_url": "",
                  "sms_fallback_method": "POST",
                  "sms_application_sid": "",
                  "address_requirements": "none",
                  "beta": false,
                  "url": "https://trunking.twilio.com/v1/Trunks/TKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "capabilities": {
                      "voice": true,
                      "sms": true,
                      "mms": true
                  },
                  "links": {
                      "phone_number": "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .phone_numbers.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers?PageSize=1&Page=0",
              "key": "phone_numbers",
              "next_page_url": null,
              "page": 0,
              "page_size": 1,
              "previous_page_url": null,
              "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers?PageSize=1&Page=0"
          },
          "phone_numbers": []
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .phone_numbers.list()

    expect(actual).to_not eq(nil)
  end
end