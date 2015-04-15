require "spec_helper"
require "base64"

describe "MessageApi" do

  before do
    Swagger.configure do |config|
      config.host = "api.burst.dev.local"
      config.base_path = "/"
      config.format = "x-www-form-urlencoded"
    end
  end

  describe "MessageApi methods" do
    it "should send sms" do
      apiKeyPwd =Base64.encode64("15ad266c538fb36c4d90f01055aef494:moose");
      response = MessageApi.send("Testing API now", "455123456", "", "", "", "", "", "", "", "", "Basic #{apiKeyPwd}")

      puts response.to_body.to_s
    end
  end

end
