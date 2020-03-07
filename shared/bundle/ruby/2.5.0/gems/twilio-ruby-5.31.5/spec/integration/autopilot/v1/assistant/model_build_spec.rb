##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'ModelBuild' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .model_builds('UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/ModelBuilds/UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds/UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "enqueued",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "sid": "UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "build_duration": null,
          "error_code": null
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .model_builds('UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .model_builds.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/ModelBuilds',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "key": "model_builds",
              "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds?PageSize=50&Page=0",
              "first_page_url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds?PageSize=50&Page=0",
              "next_page_url": null,
              "previous_page_url": null,
              "page_size": 50
          },
          "model_builds": []
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .model_builds.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "key": "model_builds",
              "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds?PageSize=50&Page=0",
              "first_page_url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds?PageSize=50&Page=0",
              "next_page_url": null,
              "previous_page_url": null,
              "page_size": 50
          },
          "model_builds": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds/UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "failed",
                  "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "sid": "UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "unique_name",
                  "build_duration": null,
                  "error_code": 23001
              }
          ]
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .model_builds.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .model_builds.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/ModelBuilds',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds/UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "enqueued",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "sid": "UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "build_duration": null,
          "error_code": null
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .model_builds.create()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .model_builds('UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/ModelBuilds/UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/ModelBuilds/UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "completed",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "sid": "UGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "build_duration": 100,
          "error_code": null
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .model_builds('UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .model_builds('UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/ModelBuilds/UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .model_builds('UGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end