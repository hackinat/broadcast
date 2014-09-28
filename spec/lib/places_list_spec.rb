require 'spec_helper'

describe Broadcast::PlacesList do

  let(:places_list) { Broadcast::PlacesList.new([12,88])}
  let(:api_url) {"http://hackin.at:443/places?ll=12,88"}
  let(:api_response_json) {'{"places":[{"id":6,"name":"The Hive - Support Bee HQ","lonlat":{"type":"Point","coordinates":[77.59909057617188,12.904683113098145]},"distance":2},{"id":8,"name":"Dollar Point","lonlat":{"type":"Point","coordinates":[77.59977722167969,12.904753684997559]},"distance":76}]}'}

  it "should throw an error if the places API returns non 200" do
    stub_request(:get, api_url).
      to_return(:status => 503)

    expect { places_list.nearby }.to raise_error(Errno::EHOSTDOWN)
  end

  it "should return a list of places nearby" do
    
    stub_request(:get, api_url).
      to_return(:status => 200, :body =>  api_response_json)
    places = places_list.nearby

    expect(places.length).to eq(2)
    expect(places[0]["name"]).to eq 'The Hive - Support Bee HQ'

  end


end

