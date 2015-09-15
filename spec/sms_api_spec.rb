require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"
require "test/unit"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end

class SmsApiTest < Test::Unit::TestCase

  def setup()
    @api = SmsApi.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def test_send()
    VCR.use_cassette("sms_api_test_send") do
      # Call method to test
      response = @api.send("Testing API to field", "61422222222")

      # Assert result
      assert response.code == 200
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_message_reply()
    VCR.use_cassette("sms_api_test_message_reply") do
      # Call method to test
      response = @api.message_reply("Testing API to field", "61422222222", "61412345678")

      # Assert result
      assert response.code == 200
      assert response.body["result"] == "SYSTEM: Message response handled\n"
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_get_message_log()
    VCR.use_cassette("sms_api_test_get_message_log") do
      # Call method to test
      response = @api.get_message_log("50694", "61422222222")

      # Assert result
      assert response.code == 200
      assert response.body["message_id"] == 50694
      assert response.body["caller_id"] == 61422345678
      assert response.body["mobile"] == 61422222222
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_send_with_list_id()
    VCR.use_cassette("sms_api_test_send_with_list_id") do
      # Call method to test
      response = @api.send("Testing API with list_id field", nil, nil, nil, 55314)

      # Assert result
      assert response.code == 200
      assert response.body["list"]["id"] == 55314
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_send_missing_to_and_list_id()
    VCR.use_cassette("sms_api_test_send_missing_to_and_list_id") do
      response = @api.send("Test error sending")

      assert response.code == 400
      assert response.body["error"]["code"] == "FIELD_INVALID"
      assert response.body["error"]["description"] == "You must provide either 'list_id' or 'to'"
    end
  end

  def test_format_number()
    VCR.use_cassette("sms_api_test_format_number") do
      response = @api.format_number("0455667889", "AU")

      assert response.code == 200
      assert response.body["number"]["countrycode"] == 61
      assert response.body["number"]["nationalnumber"] == 455667889
      assert response.body["number"]["national_leading_zeroes"] == 455667889
      assert response.body["number"]["rawinput"] == nil
      assert response.body["number"]["international"] == 61455667889
      assert response.body["number"]["type"] == 1
      assert response.body["number"]["isValid"] == true
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_format_number_fail_in_missing_msisdn()
    VCR.use_cassette("sms_api_test_format_number_fail_in_missing_msisdn") do
      response = @api.format_number("", "AU")

      assert response.code == 400
      assert response.body["error"]["code"] == "FIELD_EMPTY"
      assert response.body["error"]["description"] == "Required field 'msisdn' is empty"
    end
  end

  def test_get_sms_info()
    VCR.use_cassette("sms_api_test_get_sms_info") do
      response = @api.get_sms(27746)

      assert response.code == 200
      assert response.body["message_id"] == 27746
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_get_sms_info_fail_for_not_existing_message_id()
    VCR.use_cassette("sms_api_test_get_sms_info_fail_for_not_existing_message_id") do
      response = @api.get_sms(1)

      assert response.code == 400
      assert response.body["error"]["code"] == "NOT_FOUND"
      assert response.body["error"]["description"] == "Message with this ID does not exist"
    end
  end

  def test_get_sms_responses()
    VCR.use_cassette("sms_api_test_get_sms_responses") do
      response = @api.get_sms_responses(27746)

      assert response.code == 200
      assert response.body["total"] == 2
      assert response.body["responses"].length > 0
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_get_user_sms_responses()
    VCR.use_cassette("sms_api_test_get_user_sms_responses") do
      response = @api.get_user_sms_responses("2015-09-13 00:00:00", "2015-04-20 23:59:59")

      puts response.body
      assert response.code == 200
      assert response.body["total"] == 1
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_get_sms_sent()
    VCR.use_cassette("sms_api_test_get_sms_sent") do
      response = @api.get_sms_sent(27746)

      assert response.code == 200
      assert response.body["total"] == 2
      assert response.body["recipients"].length > 0
      assert response.body["error"]["code"] == "SUCCESS"
      assert response.body["error"]["description"] == "OK"
    end
  end

  def test_cancel_sms()
    VCR.use_cassette("sms_api_test_cancel_sms") do
      response = @api.cancel_sms(27741)

      assert response.code == 400
      assert response.body["error"]["code"] == "ALREADY_SENT"
    end
  end

end
