require 'found'

puts "Broadcast ****"

module Broadcast

  class LocationFinder

    def find
      Lost.current_position
    end

  end

end
