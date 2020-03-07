##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class AssetContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class AssetVersionList < ListResource
              ##
              # Initialize the AssetVersionList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service that the Asset Version
              #   resource is associated with.
              # @param [String] asset_sid The SID of the Asset resource that is the parent of
              #   the asset version.
              # @return [AssetVersionList] AssetVersionList
              def initialize(version, service_sid: nil, asset_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, asset_sid: asset_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Assets/#{@solution[:asset_sid]}/Versions"
              end

              ##
              # Lists AssetVersionInstance records from the API as a list.
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
              # Streams AssetVersionInstance records from the API as an Enumerable.
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
              # When passed a block, yields AssetVersionInstance records from the API.
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
              # Retrieve a single page of AssetVersionInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of AssetVersionInstance
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
                AssetVersionPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of AssetVersionInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of AssetVersionInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                AssetVersionPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Serverless.V1.AssetVersionList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class AssetVersionPage < Page
              ##
              # Initialize the AssetVersionPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [AssetVersionPage] AssetVersionPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of AssetVersionInstance
              # @param [Hash] payload Payload response from the API
              # @return [AssetVersionInstance] AssetVersionInstance
              def get_instance(payload)
                AssetVersionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    asset_sid: @solution[:asset_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Serverless.V1.AssetVersionPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class AssetVersionContext < InstanceContext
              ##
              # Initialize the AssetVersionContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the Service to fetch the Asset Version
              #   resource from.
              # @param [String] asset_sid The SID of the Asset resource that is the parent of
              #   the Asset Version resource to fetch.
              # @param [String] sid The SID of the Asset Version resource to fetch.
              # @return [AssetVersionContext] AssetVersionContext
              def initialize(version, service_sid, asset_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, asset_sid: asset_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Assets/#{@solution[:asset_sid]}/Versions/#{@solution[:sid]}"
              end

              ##
              # Fetch a AssetVersionInstance
              # @return [AssetVersionInstance] Fetched AssetVersionInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                AssetVersionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    asset_sid: @solution[:asset_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.AssetVersionContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.AssetVersionContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class AssetVersionInstance < InstanceResource
              ##
              # Initialize the AssetVersionInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the Service that the Asset Version
              #   resource is associated with.
              # @param [String] asset_sid The SID of the Asset resource that is the parent of
              #   the asset version.
              # @param [String] sid The SID of the Asset Version resource to fetch.
              # @return [AssetVersionInstance] AssetVersionInstance
              def initialize(version, payload, service_sid: nil, asset_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'asset_sid' => payload['asset_sid'],
                    'path' => payload['path'],
                    'visibility' => payload['visibility'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'asset_sid' => asset_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [AssetVersionContext] AssetVersionContext for this AssetVersionInstance
              def context
                unless @instance_context
                  @instance_context = AssetVersionContext.new(
                      @version,
                      @params['service_sid'],
                      @params['asset_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique string that identifies the Asset Version resource
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The SID of the Account that created the Asset Version resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Service that the Asset Version resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the Asset resource that is the parent of the asset version
              def asset_sid
                @properties['asset_sid']
              end

              ##
              # @return [String] The URL-friendly string by which the asset version can be referenced
              def path
                @properties['path']
              end

              ##
              # @return [asset_version.Visibility] The access control that determines how the asset version can be accessed
              def visibility
                @properties['visibility']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the Asset Version resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [String] The absolute URL of the Asset Version resource
              def url
                @properties['url']
              end

              ##
              # Fetch a AssetVersionInstance
              # @return [AssetVersionInstance] Fetched AssetVersionInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.AssetVersionInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.AssetVersionInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end