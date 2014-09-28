require 'spec_helper'

describe Broadcast do

  describe "LocationFinder" do

    it "should return an object on initialization" do
      expect(Broadcast::LocationFinder.new).to be_a_kind_of Object
    end

  end

end

