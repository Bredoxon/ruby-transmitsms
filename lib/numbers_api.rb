require "uri"

class NumbersApi
  basePath = "https://api.transmitsms.com/"
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
      config.host = "https://api.transmitsms.com/".gsub("https://", "").gsub("/", "")
      config.base_path = "/"
      config.format = "x-www-form-urlencoded"
      config.camelize_params = false
    end
  end


  # Get detailed information about a response number you have leased.
  # 
  # @param number The virtual number to retrieve
  # @return void
  def get_number (number = nil, opts={})
    query_param_keys = [:number]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'number' => number
      
    }.merge(opts)

    #resource path
    path = "/get-number.json".sub('{format}','json')
    
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

  # Get a list of numbers either leased by you or available to be leased.
  # 
  # @param filter Possible values are owned and available
  # @param page Page number, for pagination
  # @param max   Maximum results returned per page
  # @return void
  def get_numbers (filter = nil, page = nil, max = nil, opts={})
    query_param_keys = [:filter,:page,:max]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'filter' => filter,
      :'page' => page,
      :'max' => max
      
    }.merge(opts)

    #resource path
    path = "/get-numbers.json".sub('{format}','json')
    
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

  # Lease a dedicated virtual number
  # 
  # @param number The virtual number to lease. Omit this field to be given a random number. Use get-numbers to find out which numbers are currently available.
  # @return void
  def lease_number (number = nil, opts={})
    query_param_keys = [:number]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'number' => number
      
    }.merge(opts)

    #resource path
    path = "/lease-number.json".sub('{format}','json')
    
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
