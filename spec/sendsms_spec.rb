require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"

describe "Sms" do

  before do
    Swagger.configure do |config|
      config.host = "api.burst.dev.local"
      config.base_path = "/"
      config.format = "x-www-form-urlencoded"
    end
  end

  describe "SMS methods" do
    it "should send sms" do
      sms = Sms.new("15ad266c538fb36c4d90f01055aef494", "moose")
      response = sms.send("Testing API now", "61422222222")

      puts response.body
      puts response.code
    end
  end

end
