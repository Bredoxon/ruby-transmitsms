require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"
require "test/unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end

class AccountApiTest < Test::Unit::TestCase

  def setup()
    @api = AccountApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def test_get_balance()
    VCR.use_cassette("account_api_get_balance") do
      response = @api.get_balance()

      assert response.code == 200
      assert response.body["balance"] > 0.00
      assert response.body["currency"] == "SGD"
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

end
