require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"
require "test/unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end

class ListsApiTest < Test::Unit::TestCase

  def setup()
    @api = ListsApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def test_get_list()
    VCR.use_cassette("lists_api_get_list") do
      response = @api.get_list(55314)

      assert response.code == 200
      assert response.body["id"] == 55314
      assert response.body["members_total"] == 1075
      assert response.body["members_active"] == 1075
      assert response.body["members"].length > 0
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

end
