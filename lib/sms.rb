class Sms

  attr_writer :sms_api

  def initialize(api_key, api_secret)
    @api_key = api_key
    @api_secret = api_secret
    @sms_api = SmsApi

    config_swagger()
  end

  def config_swagger()
    Swagger.configure do |config|
      config.host = "api.burst.dev.local"
      config.base_path = "/"
      config.format = "x-www-form-urlencoded"
      config.camelize_params = false
    end
  end

  def send(message, to = "", from = "", send_at = "", list_id = "", dlr_callback = "", reply_callback = "", validity = "", replies_to_email = "", from_shared = "")
    apiKeySecret = Base64.encode64("#{@api_key}:#{@api_secret}")

    @sms_api.send(message, to, from, send_at, list_id, dlr_callback, reply_callback, validity, replies_to_email, from_shared, "Basic #{apiKeySecret}")
  end

end
