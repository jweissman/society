require 'rspec'
require 'society/version'

include Society
RSpec.configure do |config|
  config.before(:example) do
    PassiveRecord.drop_all
  end
end
