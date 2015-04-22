require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"

describe "Sms methods" do

  before do
    @sms = Sms.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  it "should send sms with 'to' field" do
    mock_send()

    # Call method to test
    response = @sms.send("Testing API to field", "61422222222")

    # Assert result
    expect(response.code).to(eq(200))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should send sms with 'list_id' field" do
    mock_list_id()

    # Call method to test
    response = @sms.send("Testing API with list_id field", nil, nil, nil, 55314)

    # Assert result
    expect(response.code).to(eq(200))
    expect(response.body["list"]["id"]).to(eq(55314))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should not send sms when missing 'to' field or list_id' field" do
    mock_error()

    response = @sms.send("Test error sending")

    expect(response.code).to(eq(400))
    expect(response.body["error"]["code"]).to(eq("FIELD_INVALID"))
    expect(response.body["error"]["description"]).to(eq("You must provide either 'list_id' or 'to'"))
  end

  it "should format number" do
    mock_format_number()

    response = @sms.format_number("0455667889", "AU")

    expect(response.code).to(eq(200))
    expect(response.body["number"]["countrycode"]).to(eq(61))
    expect(response.body["number"]["nationalnumber"]).to(eq(455667889))
    expect(response.body["number"]["national_leading_zeroes"]).to(eq(455667889))
    expect(response.body["number"]["rawinput"]).to(eq(nil))
    expect(response.body["number"]["international"]).to(eq(61455667889))
    expect(response.body["number"]["type"]).to(eq(1))
    expect(response.body["number"]["isValid"]).to(eq(true))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should fail format number when missing msisdn" do
    mock_format_number_fail()

    response = @sms.format_number("", "AU")

    expect(response.code).to(eq(400))
    expect(response.body["error"]["code"]).to(eq("FIELD_EMPTY"))
    expect(response.body["error"]["description"]).to(eq("Required field 'msisdn' is empty"))
  end

  it "should get sms info" do
    mock_get_sms()

    response = @sms.get_sms(27746)

    expect(response.code).to(eq(200))
    expect(response.body["message_id"]).to(eq(27746))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should fail get sms info for non-existing message_id" do
    mock_get_sms_fail()

    response = @sms.get_sms(1)

    expect(response.code).to(eq(400))
    expect(response.body["error"]["code"]).to(eq("NOT_FOUND"))
    expect(response.body["error"]["description"]).to(eq("Message with this ID does not exist"))
  end

  it "should get sms responses" do
    mock_get_sms_responses()

    response = @sms.get_sms_responses(27746)

    expect(response.code).to(eq(200))
    expect(response.body["total"]).to(eq(1))
    expect(response.body["responses"].length).to be > 0
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should get user sms responses" do
    mock_get_user_sms_responses()

    response = @sms.get_user_sms_responses("2015-01-01 00:00:00", "2015-12-31 23:59:59")

    expect(response.code).to(eq(200))
    expect(response.body["total"]).to(eq(1))
    expect(response.body["responses"].length).to be > 0
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  def mock_send()
    mock_sms_api = double("SmsApi")

    allow(mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => { 
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_list_id()
    mock_sms_api = double("SmsApi")

    allow(mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => {
          "list" => {"id" => 55314},
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_error()
    mock_sms_api = double("SmsApi")

    allow(mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => { 
          "error" => {"code" => "FIELD_INVALID", "description" => "You must provide either 'list_id' or 'to'"}
        },
        :code => 400
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_format_number()
    mock_sms_api = double("SmsApi")

    allow(mock_sms_api).to(receive(:format_number)
      .and_return(OpenStruct.new(
        :body => {
          "number" => {
            "countrycode" => 61,
            "nationalnumber" => 455667889,
            "national_leading_zeroes" => 455667889,
            "rawinput" => nil,
            "international" => 61455667889,
            "type" => 1,
            "isValid" => true
          },
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_format_number_fail()
    mock_sms_api = double("SmsApi")

    allow(mock_sms_api).to(receive(:format_number)
      .and_return(OpenStruct.new(
        :body => {
          "error" => {"code" => "FIELD_EMPTY", "description" => "Required field 'msisdn' is empty"}
        },
        :code => 400
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_get_sms()
    mock_sms_api = double("SmsApi")

    allow(mock_sms_api).to(receive(:get_sms)
      .and_return(OpenStruct.new(
        :body => {
          "message_id" => 27746,
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_get_sms_fail()
    mock_sms_api = double ("SmsApi")

    allow(mock_sms_api).to(receive(:get_sms)
      .and_return(OpenStruct.new(
        :body => {
          "error" => {"code" => "NOT_FOUND", "description" => "Message with this ID does not exist"}
        },
        :code => 400
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_get_sms_responses()
    mock_sms_api = double ("SmsApi")

    allow(mock_sms_api).to(receive(:get_sms_responses)
      .and_return(OpenStruct.new(
        :body => {
          "page" => {
            "count" => 1,
            "number" => 1
          },
          "total" => 1,
          "responses" => [
            {
              "id" => 157,
              "message_id" => 27746,
              "list_id" => 0,
              "received_at" => "2009-10-13 13:57:55",
              "first_name" => "Nathan",
              "last_name" => "Bryant",
              "msisdn" => 61406614352,
              "response" => "Second test",
              "longcode" => nil
            },
            {
              "id" => 156,
              "message_id" => 27746,
              "list_id" => 0,
              "received_at" => "2009-10-13 10:58:31",
              "first_name" => "Nathan",
              "last_name" => "Bryant",
              "msisdn" => 61406614352,
              "response" => "Testing campaign",
              "longcode" => nil
            }
          ],
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = mock_sms_api
  end

  def mock_get_user_sms_responses()
    mock_sms_api = double("SmsApi")

    allow(mock_sms_api).to(receive(:get_user_sms_responses)
      .and_return(OpenStruct.new(
        :body => {
          "page" => {"count" => 1, "number" => 1},
          "total" => 1,
          "responses" => [
            {
              "id" => 22714,
              "message_id" => 50132,
              "list_id" => 0,
              "received_at" => "2015-04-16 03:28:21",
              "first_name" => nil,
              "last_name" => nil,
              "msisdn" => 61422265777,
              "response" => "this is a faker message 3",
              "longcode" => 61422222222
            },
            {
              "id" => 22713,
              "message_id" => 50470,
              "list_id" => 55219,
              "received_at" => "2015-04-16 03:27:41",
              "first_name" => "test7",
              "last_name" => "test7",
              "msisdn" => 61422265777,
              "response" => "this is a faker message 2",
              "longcode" => 61422222222
            }
          ],
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = mock_sms_api 
  end

end
