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

  def test_get_lists()
    VCR.use_cassette("lists_api_get_lists") do
      response = @api.get_lists()

      assert response.code == 200
      assert response.body["lists_total"] == 12
      assert response.body["lists"].length > 0
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_add_list()
    VCR.use_cassette("lists_api_add_list") do
      response = @api.add_list("my_list")

      assert response.code == 200
      assert response.body["id"] == 55320
      assert response.body["name"] == "my_list"
      assert response.body["members_active"] == 0
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_add_to_list()
    VCR.use_cassette("lists_api_add_to_list") do
      response = @api.add_to_list(55314, 61491570158)

      assert response.code == 200
      assert response.body["list_id"] == 55314
      assert response.body["msisdn"] == 61491570158
      assert response.body["status"] == "active"
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_delete_from_list()
    VCR.use_cassette("lists_api_delete_from_list") do
      response = @api.delete_from_list(55314, 61491570158)

      assert response.code == 200
      assert response.body["list_ids"][0] == 55314
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_remove_list()
    VCR.use_cassette("lists_api_remove_list") do
      response = @api.remove_list(55329)

      assert response.code == 200
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_optout_list_member()
    VCR.use_cassette("lists_api_optout_list_member") do
      response = @api.optout_list_member(55314, 61400233560)

      assert response.code == 200
      assert response.body["list_ids"][0] == 55314
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_edit_list_member()
    VCR.use_cassette("lists_api_edit_list_member") do
      response = @api.edit_list_member(55314, 61400124714)

      assert response.code == 200
      assert response.body["list_id"] == 55314
      assert response.body["msisdn"] == 61400124714
      assert response.body["first_name"] == "Hugh"
      assert response.body["last_name"] == "Heller"
      assert response.body["status"] == "active"
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

end
