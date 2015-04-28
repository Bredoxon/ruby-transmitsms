require "uri"

class KeywordsApi
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


  # Add a keyword to an existing virtual number
  # 
  # @param keyword The first word of a text message
  # @param number The dedicated virtual number that the keyword belongs to
  # @param reference Your own reference (up to 100 characters)
  # @param list_id ID of a list to add respondents to, list ID&#39;s can be found in the title of a list or in the list page URL
  # @param welcome_message SMS message to send to new members
  # @param members_message SMS message to existing members
  # @param activate Whether to make the keyword active immediately.
  # @param forward_url Forward messages to a URL
  # @param forward_email Forward messages to a set of email addresses
  # @param forward_sms Forward messages to a set of msisdns
  # @return void
  def add_keyword (keyword = nil, number = nil, reference = nil, list_id = nil, welcome_message = nil, members_message = nil, activate = nil, forward_url = nil, forward_email = nil, forward_sms = nil, opts={})
    query_param_keys = [:keyword,:number,:reference,:list_id,:welcome_message,:members_message,:activate,:forward_url,:forward_email,:forward_sms]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'keyword' => keyword,
      :'number' => number,
      :'reference' => reference,
      :'list_id' => list_id,
      :'welcome_message' => welcome_message,
      :'members_message' => members_message,
      :'activate' => activate,
      :'forward_url' => forward_url,
      :'forward_email' => forward_email,
      :'forward_sms' => forward_sms
      
    }.merge(opts)

    #resource path
    path = "/add-keyword.json".sub('{format}','json')
    
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

  # Add a keyword to an existing virtual number
  # 
  # @param keyword The first word of a text message
  # @param number The dedicated virtual number that the keyword belongs to
  # @param reference Your own reference (up to 100 characters)
  # @param list_id ID of a list to add respondents to, list ID&#39;s can be found in the title of a list or in the list page URL
  # @param welcome_message SMS message to send to new members
  # @param members_message SMS message to existing members
  # @param activate Whether to make the keyword active immediately.
  # @param forward_url Forward messages to a URL
  # @param forward_email Forward messages to a set of email addresses
  # @param forward_sms Forward messages to a set of msisdns
  # @return void
  def edit_keyword (keyword = nil, number = nil, reference = nil, list_id = nil, welcome_message = nil, members_message = nil, activate = nil, forward_url = nil, forward_email = nil, forward_sms = nil, opts={})
    query_param_keys = [:keyword,:number,:reference,:list_id,:welcome_message,:members_message,:activate,:forward_url,:forward_email,:forward_sms]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'keyword' => keyword,
      :'number' => number,
      :'reference' => reference,
      :'list_id' => list_id,
      :'welcome_message' => welcome_message,
      :'members_message' => members_message,
      :'activate' => activate,
      :'forward_url' => forward_url,
      :'forward_email' => forward_email,
      :'forward_sms' => forward_sms
      
    }.merge(opts)

    #resource path
    path = "/edit-keyword.json".sub('{format}','json')
    
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

  # Get a list of existing keywords.
  # 
  # @param number Filter the list by virtual number
  # @param page Page number, for pagination
  # @param max   Maximum results returned per page
  # @return void
  def get_keywords (number = nil, page = nil, max = nil, opts={})
    query_param_keys = [:number,:page,:max]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'number' => number,
      :'page' => page,
      :'max' => max
      
    }.merge(opts)

    #resource path
    path = "/get-keywords.json".sub('{format}','json')
    
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
