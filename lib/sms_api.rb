require "uri"

class SmsApi
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


  # Update an existing sms
  # 
  # @param id Message ID
  # @return void
  def cancel_sms (id = nil, opts={})
    query_param_keys = [:id]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'id' => id
      
    }.merge(opts)

    #resource path
    path = "/cancel-sms.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # format-number
  # Format and validate a given number.
  # @param msisdn The number to check
  # @param countrycode 2 Letter countrycode to validate number against
  # @return void
  def format_number (msisdn = nil, countrycode = nil, opts={})
    query_param_keys = [:msisdn,:countrycode]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'msisdn' => msisdn,
      :'countrycode' => countrycode
      
    }.merge(opts)

    #resource path
    path = "/format-number.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # get-message-log
  # Format and validate a given number.
  # @param message_id The message to retrieve
  # @param mobile The mobile used in message
  # @return void
  def get_message_log (message_id = nil, mobile = nil, opts={})
    query_param_keys = [:message_id,:mobile]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message_id' => message_id,
      :'mobile' => mobile
      
    }.merge(opts)

    #resource path
    path = "/get-message-log.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Update an existing sms
  # 
  # @param message_id Message ID
  # @param keyword_id Keyword ID
  # @param keyword Keyword
  # @param number Filter results by response number
  # @param msisdn Filter results by a particular mobile number
  # @param page Page number, for pagination
  # @param max Maximum results returned per page
  # @param include_original include text of original message
  # @return void
  def get_sms_responses (message_id = nil, keyword_id = nil, keyword = nil, number = nil, msisdn = nil, page = nil, max = nil, include_original = nil, opts={})
    query_param_keys = [:message_id,:keyword_id,:keyword,:number,:msisdn,:page,:max,:include_original]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message_id' => message_id,
      :'keyword_id' => keyword_id,
      :'keyword' => keyword,
      :'number' => number,
      :'msisdn' => msisdn,
      :'page' => page,
      :'max' => max,
      :'include_original' => include_original
      
    }.merge(opts)

    #resource path
    path = "/get-sms-responses.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Update an existing sms
  # 
  # @param message_id Message ID&#39;s are made up of digits
  # @param optouts Whether to include optouts. Valid options are: only - only get optouts, omit - do not get optouts, include - get all recipients including optouts (default)
  # @param page Page number, for pagination
  # @param max Maximum results returned per page
  # @param delivery Only show messages with requested delivery status. Valid options are: delivered - only show delivered messages, failed - only show failed messages, pending - only show pending messages
  # @return void
  def get_sms_sent (message_id = nil, optouts = nil, page = nil, max = nil, delivery = nil, opts={})
    query_param_keys = [:message_id,:optouts,:page,:max,:delivery]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message_id' => message_id,
      :'optouts' => optouts,
      :'page' => page,
      :'max' => max,
      :'delivery' => delivery
      
    }.merge(opts)

    #resource path
    path = "/get-sms-sent.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Update an existing sms
  # 
  # @param message_id Message ID
  # @return void
  def get_sms (message_id = nil, opts={})
    query_param_keys = [:message_id]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message_id' => message_id
      
    }.merge(opts)

    #resource path
    path = "/get-sms.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Update an existing sms
  # 
  # @param start A timestamp to start the report from
  # @param enddate A timestamp to end the report at
  # @param page Page number, for pagination
  # @param max Maximum results returned per page
  # @param keywords Filter if keyword responses should be included. Can be: ‘only’ - only keyword responses will be included‘omit’ - only regular campaign responses will be included. ‘both’ - both keyword and campaign responses will be included (default)
  # @param include_original include text of original message
  # @return void
  def get_user_sms_responses (start = nil, enddate = nil, page = nil, max = nil, keywords = nil, include_original = nil, opts={})
    query_param_keys = [:start,:enddate,:page,:max,:keywords,:include_original]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'start' => start,
      :'enddate' => enddate,
      :'page' => page,
      :'max' => max,
      :'keywords' => keywords,
      :'include_original' => include_original
      
    }.merge(opts)

    #resource path
    path = "/get-user-sms-responses.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:GET, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Reply to a message
  # message-reply
  # @param message Message text
  # @param from Set the alphanumeric Caller ID
  # @param to Number or set of up to 10,000 numbers to send the SMS to. If your number set has some invalid numbers, they won’t cause validation error, but will be returned as ‘fails’ parameter of the response (see example 3).
  # @return void
  def message_reply (message = nil, from = nil, to = nil, opts={})
    query_param_keys = [:message,:from,:to]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message' => message,
      :'from' => from,
      :'to' => to
      
    }.merge(opts)

    #resource path
    path = "/message-reply.json".sub('{format}','json')
    
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

  # Update an existing sms
  # 
  # @param message Message text
  # @param to Number or set of up to 10,000 numbers to send the SMS to. If your number set has some invalid numbers, they won’t cause validation error, but will be returned as ‘fails’ parameter of the response (see example 3).
  # @param from Set the alphanumeric Caller ID
  # @param send_at A time in the future to send the message
  # @param list_id This ID is the numerical reference to one of your recipient lists
  # @param dlr_callback A URL on your system which we can call to notify you of Delivery Receipts. If required, this Parameter can be different for each message sent and will take precedence over the DLR Callback URL supplied by you in the API Settings.
  # @param reply_callback A URL on your system which we can call to notify you of incoming messages. If required, this parameter can be different and will take precedence over the Reply Callback URL supplied by you on the API Settings.
  # @param validity Specify the maximum time to attempt to deliver. In minutes, 0 (zero) implies no limit.
  # @param replies_to_email Specify an email address to send responses to this message. NOTE: specified email must be authorised to send messages via add-email or in your account under the &#39;Email SMS&#39; section.
  # @param from_shared Forces sending via the shared number when you have virtual numbers
  # @return void
  def send (message = nil, to = nil, from = nil, send_at = nil, list_id = nil, dlr_callback = nil, reply_callback = nil, validity = nil, replies_to_email = nil, from_shared = nil, opts={})
    query_param_keys = [:message,:to,:from,:send_at,:list_id,:dlr_callback,:reply_callback,:validity,:replies_to_email,:from_shared]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message' => message,
      :'to' => to,
      :'from' => from,
      :'send_at' => send_at,
      :'list_id' => list_id,
      :'dlr_callback' => dlr_callback,
      :'reply_callback' => reply_callback,
      :'validity' => validity,
      :'replies_to_email' => replies_to_email,
      :'from_shared' => from_shared
      
    }.merge(opts)

    #resource path
    path = "/send-sms.json".sub('{format}','json')
    
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
