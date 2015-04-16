require "uri"

class SmsApi
  basePath = "http://api.burst.dev.local/"
  # apiInvoker = APIInvoker


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
  # @return Success
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
