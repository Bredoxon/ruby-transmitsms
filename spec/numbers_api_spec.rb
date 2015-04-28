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
  def test_get_number
    VCR.use_cassette("numbers_api_get_number") do
      api = NumbersApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
      response = api.get_number("61422222222")

      puts response.code
      puts response.body
    end
  end
end
