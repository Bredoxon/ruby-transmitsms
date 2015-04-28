require "uri"

class EmailApi
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


  # Authorise an email address for sending Email to SMS
  # 
  # @param email Email address to register. You may also register a wild-card email which allows any user on the same domain to use Email to SMS.
  # @param max_sms The maximum number of SMS messages to send from one email message sent from this email address.
  # @param number Optional dedicated virtual number virtual number
  # @return void
  def add_email (email = nil, max_sms = nil, number = nil, opts={})
    query_param_keys = [:email,:max_sms,:number]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'email' => email,
      :'max_sms' => max_sms,
      :'number' => number
      
    }.merge(opts)

    #resource path
    path = "/add-email.json".sub('{format}','json')
    
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
    _header_content_type = ['application/x-www-form-urlencoded', ]
    headerParams['Content-Type'] = _header_content_type.length > 0 ? _header_content_type[0] : 'application/json'

    
    
    headers[:'Authorization'] = @api_key_secret

    # http body (model)
    post_body = nil
    
    # form parameters
    form_parameter_hash = {}
    
    
    
    Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Remove an email address from the Email to SMS authorised list.
  # 
  # @param email Email address to remove. You may also use a wild-card email which removes all emails on that domain.
  # @return void
  def delete_email (email = nil, opts={})
    query_param_keys = [:email]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'email' => email
      
    }.merge(opts)

    #resource path
    path = "/delete-email.json".sub('{format}','json')
    
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
    _header_content_type = ['application/x-www-form-urlencoded', ]
    headerParams['Content-Type'] = _header_content_type.length > 0 ? _header_content_type[0] : 'application/json'

    
    
    headers[:'Authorization'] = @api_key_secret

    # http body (model)
    post_body = nil
    
    # form parameters
    form_parameter_hash = {}
    
    
    
    Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end
end
