require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"

describe "Sms methods" do

  before do
    @sms = Sms.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  it "should send sms with 'to' field" do
    setup_mock()

    # Call method to test
    response = @sms.send("Testing API to field", "61422222222")

    # Assert result
    expect(response.code).to(eq(200))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should send sms with 'list_id' field" do
    setup_mock_list_id()

    # Call method to test
    response = @sms.send("Testing API with list_id field", nil, nil, nil, 55314)

    # Assert result
    expect(response.code).to(eq(200))
    expect(response.body["list"]["id"]).to(eq(55314))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should not send sms for missing 'to' field or list_id' field" do
    setup_mock_error()

    response = @sms.send("Test error sending")

    expect(response.code).to(eq(400))
    expect(response.body["error"]["code"]).to(eq("FIELD_INVALID"))
    expect(response.body["error"]["description"]).to(eq("You must provide either 'list_id' or 'to'"))
  end

  def setup_mock()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => { 
          "error" => { "code" => "SUCCESS", "description" => "OK" }
        },
        :code => 200
      )))

    @sms.sms_api = @mock_sms_api
  end

  def setup_mock_list_id()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => {
          "list" => {"id" => 55314},
          "error" => { "code" => "SUCCESS", "description" => "OK"}
        },
        :code => 200
      )))

    @sms.sms_api = @mock_sms_api
  end

  def setup_mock_error()
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => { 
          "error" => { "code" => "FIELD_INVALID", "description" => "You must provide either 'list_id' or 'to'" }
        },
        :code => 400
      )))

    @sms.sms_api = @mock_sms_api
  end

end
