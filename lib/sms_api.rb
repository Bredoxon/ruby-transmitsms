require "uri"

class SmsApi
  basePath = "http://api.burst.dev.local/"
  # apiInvoker = APIInvoker


  # Update an existing sms
  # 
  # @param msisdn The number to check
  # @param countrycode 2 Letter countrycode to validate number against
  # @param authorization in format key secret
  # @return void
  def self.format_number (msisdn, countrycode, authorization, opts={})
    query_param_keys = [:msisdn,:countrycode]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'msisdn' => msisdn,
      :'countrycode' => countrycode,
      :'authorization' => authorization
      
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
    _header_content_type = ['application/x-www-form-urlencoded', ]
    headerParams['Content-Type'] = _header_content_type.length > 0 ? _header_content_type[0] : 'application/json'

    
    headers[:'Authorization'] = authorization
    # http body (model)
    post_body = nil
    
    # form parameters
    form_parameter_hash = {}
    
    
    
    Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
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
  # @param authorization in format key secret
  # @return void
  def self.get_sms_responses (message_id, keyword_id, keyword, number, msisdn, page, max, include_original, authorization, opts={})
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
      :'include_original' => include_original,
      :'authorization' => authorization
      
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
    _header_content_type = ['application/x-www-form-urlencoded', ]
    headerParams['Content-Type'] = _header_content_type.length > 0 ? _header_content_type[0] : 'application/json'

    
    headers[:'Authorization'] = authorization
    # http body (model)
    post_body = nil
    
    # form parameters
    form_parameter_hash = {}
    
    
    
    Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Update an existing sms
  # 
  # @param message_id Message ID
  # @param authorization in format key secret
  # @return void
  def self.get_sms (message_id, authorization, opts={})
    query_param_keys = [:message_id]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message_id' => message_id,
      :'authorization' => authorization
      
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
    _header_content_type = ['application/x-www-form-urlencoded', ]
    headerParams['Content-Type'] = _header_content_type.length > 0 ? _header_content_type[0] : 'application/json'

    
    headers[:'Authorization'] = authorization
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
  # @param authorization in format key secret
  # @return void
  def self.send (message, to, from, send_at, list_id, dlr_callback, reply_callback, validity, replies_to_email, from_shared, authorization, opts={})
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
      :'from_shared' => from_shared,
      :'authorization' => authorization
      
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
    _header_content_type = ['application/x-www-form-urlencoded', ]
    headerParams['Content-Type'] = _header_content_type.length > 0 ? _header_content_type[0] : 'application/json'

    
    headers[:'Authorization'] = authorization
    # http body (model)
    post_body = nil
    
    # form parameters
    form_parameter_hash = {}
    
    
    
    Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end
end
