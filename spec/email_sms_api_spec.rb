require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"
require "test/unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end

class EmailApiTest < Test::Unit::TestCase

  def setup()
    @api = EmailApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def test_add_email()
    VCR.use_cassette("email_sms_api_add_email") do
      response = @api.add_email("test@email.com")

      assert response.code == 200
      assert response.body["success"] == true
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_delete_email()
    VCR.use_cassette("email_sms_api_delete_email") do
      response = @api.delete_email("test@email.com")

      assert response.code == 200
      assert response.body["success"] == true
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

end
