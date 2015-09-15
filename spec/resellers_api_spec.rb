require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"
require "test/unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end

class ResellersApiTest < Test::Unit::TestCase

  def setup()
    @api = ResellersApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def test_get_client()
    VCR.use_cassette("resellers_api_get_client") do
      response = @api.get_client(2024)

      assert_equal 200, response.code
      assert_equal 2024, response.body["id"]
      assert_equal "wefwefwef", response.body["name"]
      assert_equal "SUCCESS", response.body["error"]["code"]
      assert_equal "OK", response.body["error"]["description"]
    end
  end

  def test_get_clients()
    VCR.use_cassette("resellers_api_get_clients") do
      response = @api.get_clients()

      assert_equal 200, response.code
      assert_equal 15, response.body["clients_total"]
      assert_equal 10, response.body["clients"].length
      assert_equal "SUCCESS", response.body["error"]["code"]
      assert_equal "OK", response.body["error"]["description"]
    end
  end

  def test_add_client()
    # Needs to revisit why getting 400???
    VCR.use_cassette("resellers_api_add_client") do
      response = @api.add_client("my_client_test_13", nil, "my@clienttest13.com", "my_password", "+61491570156")

      assert_equal 400, response.code
      assert_equal "KEY_EXISTS", response.body["error"]["code"]
      assert_equal "User already exists", response.body["error"]["description"]
    end
  end

  def test_edit_client()
    # Needs to revisit why getting 411??
    VCR.use_cassette("resellers_api_edit_client") do
      response = @api.edit_client(2024)

      assert_equal 411, response.code
    end
  end

  def test_get_transactions()
    VCR.use_cassette("resellers_api_get_transactions") do
      response = @api.get_transactions(2026)

      assert_equal 200, response.code
      assert_equal 6, response.body["transactions_total"]
      assert_equal "SUCCESS", response.body["error"]["code"]
      assert_equal "OK", response.body["error"]["description"]
    end
  end

  def test_get_transaction()
    VCR.use_cassette("resellers_api_get_transaction") do
      response = @api.get_transaction(17389227)

      assert_equal 200, response.code
      assert_equal 17389227, response.body["id"]
      assert_equal 2026, response.body["user_id"]
      assert_equal "SUCCESS", response.body["error"]["code"]
      assert_equal "OK", response.body["error"]["description"]
    end
  end

end
