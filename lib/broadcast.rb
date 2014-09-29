require 'json'
require "broadcast/version"
require "broadcast/location_finder"
require "broadcast/places_list"

module Broadcast
  # Your code goes here...
  API_BASE_DOMAIN = "https://hackin.at"

  class Base

    def initialize(options)
      @location = options[:location]
      @message = options[:message]
      @place_id = options[:place_id]
    end

    def create

      uri = URI("#{Broadcast::API_BASE_DOMAIN}/logs")
      res = Net::HTTP.post_form(uri, {log: {
        place_id: @place_id,
        ll: "#{@location[0]},#{@location[1]}",
        message: @message
      }})
      
      raise Errno::EHOSTDOWN

    end

  end
end
