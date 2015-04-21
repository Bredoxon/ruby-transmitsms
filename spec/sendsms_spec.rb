require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"

describe "Sms methods" do

  before do
    @sms = Sms.new("15ad266c538fb36c4d90f01055aef494", "moose")
  end

  def setup_mock(code = 200, errorCode = "SUCCESS", errorDesc = "OK")
    @mock_sms_api = double("SmsApi")

    allow(@mock_sms_api).to(receive(:send)
      .and_return(OpenStruct.new(
        :body => { 
          "error" => {
            "code" => errorCode,
            "description" => errorDesc
          }
        },
        :code => 200
      )))

    @sms.sms_api = @mock_sms_api
  end

  it "should send sms with 'to' field" do
    setup_mock()

    # Call method to test
    response = @sms.send("Testing API now", "61422222222")

    # Assert result
    expect(response.code).to(eq(200))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
  end

  it "should send sms with 'list_id' field" do
    setup_mock_list_id()

    # Call method to test
    response = @sms.send("Testing API now", nil, nil, nil, 55314)

    # Assert result
    expect(response.code).to(eq(200))
    expect(response.body["list"]["id"]).to(eq(55314))
    expect(response.body["error"]["code"]).to(eq("SUCCESS"))
    expect(response.body["error"]["description"]).to(eq("OK"))
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

end
