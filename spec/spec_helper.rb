require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require "paperclip/matchers"

RSpec.configure do |config|
  config.include Paperclip::Shoulda::Matchers
end
