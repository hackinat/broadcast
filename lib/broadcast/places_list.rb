module Broadcast

  class PlacesList

    def initialize(location)
      @location = location
    end

    def nearby
      #raise StandardError
      []
      uri = URI("#{Broadcast::API_BASE_DOMAIN}/places")
      params = { ll: "#{@location[0]},#{@location[1]}"}
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        places_json = JSON.parse(res.body) 
        return places_json["places"]
      else
        raise Errno::EHOSTDOWN
      end

    end

  end

end
