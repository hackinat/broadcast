require 'pry'
require 'broadcast'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.mock_framework = :flexmock
end
