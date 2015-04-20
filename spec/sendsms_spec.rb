require "rubygems"
require "bundler/setup"
require "ruby-transmitsms"

describe "Sms methods" do

  before do
    @sms = Sms.new("15ad266c538fb36c4d90f01055aef494", "moose")

    # Mock
    @sms_api = double("SmsApi")
    allow(@sms_api).to(receive(:send)
      .and_return(OpenStruct.new(:body => "Hello, Mock API Response", :code => 200 )))
  end

  it "should send sms with 'to' field" do
    @sms.sms_api = @sms_api

    # Call method to test
    response = @sms.send("Testing API now", "61422222222")

    # Assert result
    expect(response.body).to(eq("Hello, Mock API Response"))
    expect(response.code).to(eq(200))
  end

  it "should send sms with 'list_id' field" do
    @sms.sms_api = @sms_api

    # Call method to test
    response = @sms.send("Testing API now", :list_id => "123")

    # Assert result
    expect(response.body).to(eq("Hello, Mock API Response"))
    expect(response.code).to(eq(200))
  end

  it "should raise ArgumentError" do
    begin
      # Call method to test
      expect(@sms.send("Testing API now")).to(raise_exception)
    rescue ArgumentError => ae
        # do nothing
    end
  end

end
