require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"
require "test/unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end

class VCRTest < Test::Unit::TestCase

  def setup()
    @api = NumbersApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def test_get_number()
    VCR.use_cassette("numbers_api_get_number") do
      response = @api.get_number("+61422222222")

      assert response.code == 200
      assert response.body["number"] == 61422222222
      assert response.body["auto_renew"] == true
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"

    end
  end

  def test_get_numbers()
    VCR.use_cassette("numbers_api_get_numbers") do
      response = @api.get_numbers("+61422222222")

      assert response.code == 200
      assert response.body["numbers"].length > 0
      assert response.body["numbers_total"] == 4
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_lease_number()
    VCR.use_cassette("numbers_api_lease_number") do
      response = @api.lease_number("0422222213")

      assert response.code == 400
      assert response.body["error"]["code"] == "FIELD_INVALID"
      assert response.body["error"]["description"] == "This number is not available for lease."
    end
  end

end
