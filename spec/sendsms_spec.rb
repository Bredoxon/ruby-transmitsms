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

  def mock_send()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => { 
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = @mock_sms_api
  end

  def mock_list_id()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => {
          "list" => {"id" => 55314},
          "error" => {"code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = @mock_sms_api
  end

  def mock_error()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => { 
          "error" => {"code" => "FIELD_INVALID", "description" => "You must provide either 'list_id' or 'to'"}
        },
        :code => 400
      )))

    @sms.sms_api = @mock_sms_api
  end

  def mock_format_number()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:format_number)
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
          "error" => {"code" => "SUCCESS", "description" => "OK"}},
        :code => 200
      )))
  end

  def mock_format_number_fail()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:format_number)
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
          "error" => {"code" => "SUCCESS", "description" => "OK"}},
        :code => 200
      )))
  end

end
