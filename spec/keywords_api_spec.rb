require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"
require "test/unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end

class KeywordsApiTest < Test::Unit::TestCase

  def setup()
    @api = KeywordsApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def test_add_keyword()
    VCR.use_cassette("keywords_api_add_keyword") do
      response = @api.add_keyword("NEWS", 61422222222)

      assert response.code == 200
      assert response.body["keyword"] == "NEWS"
      assert response.body["number"] == 61422222222
      assert response.body["status"] == "open"
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_edit_keyword()
    VCR.use_cassette("keywords_api_edit_keyword") do
      response = @api.edit_keyword("NEWS", 61422222222)

      assert response.code == 200
      assert response.body["keyword"] == "NEWS"
      assert response.body["number"] == 61422222222
      assert response.body["status"] == "open"
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_get_keyword()
    VCR.use_cassette("keywords_api_get_keywords") do
      response = @api.get_keywords(61422222222)

      assert response.code == 200
      assert response.body["keywords_total"] == 6
      assert response.body["keywords"].length == 6
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

end
