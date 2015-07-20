require "uri"

class AccountApi
  basePath = "http://api.burst.dev.local/"
  # apiInvoker = APIInvoker

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
      config.host = "http://api.burst.dev.local/".gsub("http://", "").gsub("/", "")
      config.base_path = "/"
      config.format = "x-www-form-urlencoded"
      config.camelize_params = false
    end
  end


  # Get a summary of your account balance.
  # 
  # @return void
  def get_balance (opts={})
    query_param_keys = []
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      
    }.merge(opts)

    #resource path
    path = "/get-balance.json".sub('{format}','json')
    
    # pull querystring keys from options
    queryopts = options.select do |key,value|
      query_param_keys.include? key
    end

    # header parameters
    headers = {}

    _header_accept = 'application/json'
    if _header_accept != ''
      headerParams['Accept'] = _header_accept
    end 
    _header_content_type = ['application/x-www-form-urlencoded']
    headerParams['Content-Type'] = _header_content_type.length > 0 ? _header_content_type[0] : 'application/json'

    
    
    headers[:'Authorization'] = @api_key_secret

    # http body (model)
    post_body = nil
    
    # form parameters
    form_parameter_hash = {}
    
    
    
    Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end
end
