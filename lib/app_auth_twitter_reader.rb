require "app_auth_twitter_reader/version"
require "net/https"
require "uri"
require "base64"
require "json"
require "optparse"

module AppAuthTwitterReader

  # twitter API client via application-only authentication.
  # See:https://dev.twitter.com/oauth/application-only
  class Client

    def initialize
      @token_endpoint    = 'https://api.twitter.com/oauth2/token'
      @timeline_endpoint = 'https://api.twitter.com/1.1/statuses/user_timeline.json'
    end

    def auth_for_token_endpoint(key, secret)
      return 'Basic ' + Base64.strict_encode64(key + ':' + secret)
    end

    def get_access_token(key:, secret:)
      uri  = URI.parse(@token_endpoint)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Authorization'] = self.auth_for_token_endpoint(key, secret)
      request.set_form_data({"grant_type" => "client_credentials"})

      response = http.request(request)
      data = JSON.parse(response.body)
      return data['access_token'] || "may be key or secret is invalid"
    end

    # See: https://dev.twitter.com/rest/reference/get/statuses/user_timeline
    def get_user_timeline(access_token:, screen_name:, count:, max_id:nil)
      query_string = "?" + "count=#{count}&screen_name=#{screen_name}"
      query_string += "&max_id=#{max_id}" unless max_id.nil?
      uri = URI.parse( @timeline_endpoint + query_string)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request  = Net::HTTP::Get.new(uri)
      request['Authorization'] = 'Bearer ' + access_token
      response = http.request(request)
      if response.is_a?(Net::HTTPSuccess) then
        return [JSON.parse(response.body), nil]
      else
        return [nil, "twitter api returned error. #{response.body}"]
      end
    end

  end
end
