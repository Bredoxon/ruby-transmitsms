class Sms

  attr_writer :sms_api

  def initialize(api_key, api_secret)
    @api_key = api_key
    @api_secret = api_secret
    @sms_api = SmsApi

    @api_key_secret = create_api_key_secret()

    config_swagger()
  end

  def create_api_key_secret()
    api_key_secret = Base64.encode64("#{@api_key}:#{@api_secret}")
    "Basic #{api_key_secret}"
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
    @sms_api.send(message, to, from, send_at, list_id, dlr_callback, reply_callback, validity, replies_to_email, from_shared, @api_key_secret)
  end

  def format_number(msisdn, countrycode)
    @sms_api.format_number(msisdn, countrycode, @api_key_secret)
  end

  def get_sms(message_id)
    @sms_api.get_sms(message_id, @api_key_secret)
  end

  def get_sms_responses(message_id = nil, keyword_id = nil, keyword = nil, number = nil, msisdn = nil, page = nil, max = nil, include_original = nil)
    @sms_api.get_sms_responses(message_id, keyword_id, keyword, number, msisdn, page, max, include_original, @api_key_secret)
  end

end
