require 'spec_helper'

describe Broadcast::LocationFinder do

  let(:location_finder) { Broadcast::LocationFinder.new }

  it "should query CoreUtil for finding location" do
  
    expected_lat, expected_long = [12.904, 77.598]

    lost_double = flexmock(Lost)
    lost_double.should_receive(:current_position).once.and_return [expected_lat, expected_long]
    lat,long = location_finder.find()

    expect(lat).to eq(expected_lat)
    expect(long).to eq(expected_long)
    
  end

end

