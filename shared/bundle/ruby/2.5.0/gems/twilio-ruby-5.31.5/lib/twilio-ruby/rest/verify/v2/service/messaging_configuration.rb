##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class MessagingConfigurationList < ListResource
            ##
            # Initialize the MessagingConfigurationList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/verify/api/service) that the resource is
            #   associated with.
            # @return [MessagingConfigurationList] MessagingConfigurationList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/MessagingConfigurations"
            end

            ##
            # Retrieve a single page of MessagingConfigurationInstance records from the API.
            # Request is executed immediately.
            # @param [String] country The
            #   [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of
            #   the country this configuration will be applied to. If this is a global
            #   configuration, Country will take the value `all`.
            # @param [String] messaging_service_sid The SID of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services/api) to be used to send SMS to
            #   the country of this configuration.
            # @return [MessagingConfigurationInstance] Newly created MessagingConfigurationInstance
            def create(country: nil, messaging_service_sid: nil)
              data = Twilio::Values.of({'Country' => country, 'MessagingServiceSid' => messaging_service_sid, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              MessagingConfigurationInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Lists MessagingConfigurationInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams MessagingConfigurationInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields MessagingConfigurationInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of MessagingConfigurationInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of MessagingConfigurationInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              MessagingConfigurationPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of MessagingConfigurationInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of MessagingConfigurationInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              MessagingConfigurationPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Verify.V2.MessagingConfigurationList>'
            end
          end

          class MessagingConfigurationPage < Page
            ##
            # Initialize the MessagingConfigurationPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [MessagingConfigurationPage] MessagingConfigurationPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of MessagingConfigurationInstance
            # @param [Hash] payload Payload response from the API
            # @return [MessagingConfigurationInstance] MessagingConfigurationInstance
            def get_instance(payload)
              MessagingConfigurationInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Verify.V2.MessagingConfigurationPage>'
            end
          end

          class MessagingConfigurationContext < InstanceContext
            ##
            # Initialize the MessagingConfigurationContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/verify/api/service) that the resource is
            #   associated with.
            # @param [String] country The
            #   [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of
            #   the country this configuration will be applied to. If this is a global
            #   configuration, Country will take the value `all`.
            # @return [MessagingConfigurationContext] MessagingConfigurationContext
            def initialize(version, service_sid, country)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, country: country, }
              @uri = "/Services/#{@solution[:service_sid]}/MessagingConfigurations/#{@solution[:country]}"
            end

            ##
            # Update the MessagingConfigurationInstance
            # @param [String] messaging_service_sid The SID of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services/api) to be used to send SMS to
            #   the country of this configuration.
            # @return [MessagingConfigurationInstance] Updated MessagingConfigurationInstance
            def update(messaging_service_sid: nil)
              data = Twilio::Values.of({'MessagingServiceSid' => messaging_service_sid, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              MessagingConfigurationInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  country: @solution[:country],
              )
            end

            ##
            # Fetch a MessagingConfigurationInstance
            # @return [MessagingConfigurationInstance] Fetched MessagingConfigurationInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              MessagingConfigurationInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  country: @solution[:country],
              )
            end

            ##
            # Deletes the MessagingConfigurationInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Verify.V2.MessagingConfigurationContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Verify.V2.MessagingConfigurationContext #{context}>"
            end
          end

          class MessagingConfigurationInstance < InstanceResource
            ##
            # Initialize the MessagingConfigurationInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/verify/api/service) that the resource is
            #   associated with.
            # @param [String] country The
            #   [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of
            #   the country this configuration will be applied to. If this is a global
            #   configuration, Country will take the value `all`.
            # @return [MessagingConfigurationInstance] MessagingConfigurationInstance
            def initialize(version, payload, service_sid: nil, country: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'country' => payload['country'],
                  'messaging_service_sid' => payload['messaging_service_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'country' => country || @properties['country'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [MessagingConfigurationContext] MessagingConfigurationContext for this MessagingConfigurationInstance
            def context
              unless @instance_context
                @instance_context = MessagingConfigurationContext.new(
                    @version,
                    @params['service_sid'],
                    @params['country'],
                )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the Service that the resource is associated with
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The ISO-3166-1 country code of the country or `all`.
            def country
              @properties['country']
            end

            ##
            # @return [String] The SID of the Messaging Service used for this configuration.
            def messaging_service_sid
              @properties['messaging_service_sid']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # Update the MessagingConfigurationInstance
            # @param [String] messaging_service_sid The SID of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services/api) to be used to send SMS to
            #   the country of this configuration.
            # @return [MessagingConfigurationInstance] Updated MessagingConfigurationInstance
            def update(messaging_service_sid: nil)
              context.update(messaging_service_sid: messaging_service_sid, )
            end

            ##
            # Fetch a MessagingConfigurationInstance
            # @return [MessagingConfigurationInstance] Fetched MessagingConfigurationInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the MessagingConfigurationInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Verify.V2.MessagingConfigurationInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Verify.V2.MessagingConfigurationInstance #{values}>"
            end
          end
        end
      end
    end
  end
end