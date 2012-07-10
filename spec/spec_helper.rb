require 'pony'
require 'email_spec'

RSpec.configure do |config|
  config.mock_with :rspec
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
end

require 'webmock/rspec'
WebMock.disable_net_connect!
