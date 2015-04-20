class Sms

  attr_writer :sms_api

  def initialize(api_key, api_secret)
    @api_key = api_key
    @api_secret = api_secret
    @sms_api = SmsApi

    config_swagger
  end

  def config_swagger()
    Swagger.configure {|config|
      config.host = "api.burst.dev.local"
      config.base_path = "/" 
      config.format = "x-www-form-urlencoded"
    }
  end

  def send(message, to = "", from = "", send_at = "", list_id = "", dlr_callback = "", reply_callback = "", validity = "", replies_to_email = "", from_shared = "")
    if to == "" and list_id == ""
        raise(ArgumentError, "'to' field or 'list_id' field must be declared")
    end

    apiKeySecret = Base64.encode64("#{@api_key}:#{@api_secret}")
    @sms_api.send(message, to, "", "", "", "", "", "", "", "", "Basic #{apiKeySecret}")
  end

end
