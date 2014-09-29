require 'spec_helper'

describe Broadcast do

  describe Broadcast::Base do 
    let(:broadcast) {Broadcast::Base.new(location: [12,88], message: 'message', place_id: 6)}
    let(:api_url) {"http://hackin.at:443/broadcast"}
    let(:api_response_json) {'{"id":285,"logged_at":{"place":{"id":6,"name":"The Hive - Support Bee HQ","lonlat":{"type":"Point","coordinates":[77.59909057617188,12.904683113098145]}},"lonlat":{"type":"Point","coordinates":[77.59908349999999,12.9046696]}},"created_at":"2014-09-28 09:46:05 UTC","message":"Hello Gecko","logged_by":{"id":2,"name":"Prateek Dayal","login":"prateekdayal","avatar_url":"https://avatars.githubusercontent.com/u/66077?v=2&s=128","email":"prateek@supportbee.com","company":"SupportBee","location":"Bangalore","github_followers":53,"github_following":21,"github_repos":24,"stickers":[{"sticker":1,"name":"JavaScript","icon_key":"prog-js01"},{"sticker":2,"name":"Ruby","icon_key":"prog-ruby"},{"sticker":6,"name":"ActionScript","icon_key":"prog-actionscript"}],"twitter_enabled":true}}'}

    it "should throw an error if the API is unavailable" do
      stub_request(:post, api_url).
        to_return(:status => 503)
      
      expect { broadcast.create }.to raise_error(Errno::EHOSTDOWN)

    end

    it "should create a broadcast using a place_id and a message" do
      stub_request(:post, api_url).
        with(:body => hash_including({"log" => {place_id: 6, ll: '12,88', message: 'message'}})).
        to_return(:status => 200, :body => api_response_json)

      log = broadcast.create

      expect(log.id).to eq(285)
      expect(log['logged_at']['place']['id']).to eq(6)



    end

  end
end

