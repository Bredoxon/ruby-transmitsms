require "uri"

class SendSmsApi
  basePath = "https://api.burst.dev.local/"
  # apiInvoker = APIInvoker

  def self.escapeString(string)
    URI.encode(string.to_s)
  end


  # 
  # 
  # @param message the message to send
  # @param to the receipient of the message
  # @param authorization in format key secret
  # @return void
  def self.sendSms (message, to, authorization, opts={})
    query_param_keys = []
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'message' => message,
      :'to' => to,
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
    
    form_parameter_hash["message"] = message
    form_parameter_hash["to"] = to
    
    
    Swagger::Request.new(:POST, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end
end
