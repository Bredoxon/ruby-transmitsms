class Sms
  attr_accessor :api_key, :api_secret

  def initialize(api_key, api_secret)
    @api_key = api_key
    @api_secret = api_secret
  end

  def send(message, to)
    Swagger.configure do |config|
      config.host = "api.burst.dev.local"
      config.base_path = "/" 
      config.format = "x-www-form-urlencoded"
    end

    apiKeySecret = Base64.encode64("#{@api_key}:#{@api_secret}")
    SmsApi.send(message, to, "", "", "", "", "", "", "", "", "Basic #{apiKeySecret}")
  end

end
