require "uri"

class ResellersApi
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
      config.host = "https://api.transmitsms.com/".gsub("http://", "").gsub("https://", "").gsub("/", "")
      config.base_path = "/"
      config.format = "x-www-form-urlencoded"
      config.camelize_params = false
    end
  end


  # Add a new client.
  # 
  # @param name Client company name
  # @param contact Contact name
  # @param email Client email address
  # @param password Client password
  # @param msisdn Client phone number
  # @param timezone A valid timezone, Australia/Sydney. Defaults to your own
  # @param client_pays Set to true if the client will pay (the default) or false if you will pay
  # @param sms_margin The number of cents to add to the base SMS price. A decimal value
  # @param number_margin The number of cents to add to the base Number price. A decimal value
  # @return void
  def add_client (name = nil, contact = nil, email = nil, password = nil, msisdn = nil, timezone = nil, client_pays = nil, sms_margin = nil, number_margin = nil, opts={})
    query_param_keys = [:name,:contact,:email,:password,:msisdn,:timezone,:client_pays,:sms_margin,:number_margin]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'name' => name,
      :'contact' => contact,
      :'email' => email,
      :'password' => password,
      :'msisdn' => msisdn,
      :'timezone' => timezone,
      :'client_pays' => client_pays,
      :'sms_margin' => sms_margin,
      :'number_margin' => number_margin
      
    }.merge(opts)

    #resource path
    path = "/add-client.json".sub('{format}','json')
    
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

  # Edit an existing client
  # 
  # @param client_id The ID of the client
  # @param name Client company name
  # @param contact Contact name
  # @param email Client email address
  # @param password Client password
  # @param msisdn Client phone number
  # @param timezone A valid timezone, Australia/Sydney. Defaults to your own
  # @param client_pays Set to true if the client will pay (the default) or false if you will pay
  # @param sms_margin The number of cents to add to the base SMS price. A decimal value
  # @return void
  def edit_client (client_id = nil, name = nil, contact = nil, email = nil, password = nil, msisdn = nil, timezone = nil, client_pays = nil, sms_margin = nil, opts={})
    query_param_keys = [:client_id,:name,:contact,:email,:password,:msisdn,:timezone,:client_pays,:sms_margin]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'client_id' => client_id,
      :'name' => name,
      :'contact' => contact,
      :'email' => email,
      :'password' => password,
      :'msisdn' => msisdn,
      :'timezone' => timezone,
      :'client_pays' => client_pays,
      :'sms_margin' => sms_margin
      
    }.merge(opts)

    #resource path
    path = "/edit-client.json".sub('{format}','json')
    
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
    
    
    
    Swagger::Request.new(:PUT, path, {:params=>queryopts,:headers=>headers, :body=>post_body, :form_params => form_parameter_hash }).make
    
  
  end

  # Get detailed information about a client.
  # 
  # @param client_id The ID of the client
  # @return void
  def get_client (client_id = nil, opts={})
    query_param_keys = [:client_id]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'client_id' => client_id
      
    }.merge(opts)

    #resource path
    path = "/get-client.json".sub('{format}','json')
    
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

  # Get a list of all clients.
  # 
  # @param page Page number, for pagination
  # @param max Maximum results returned per page
  # @return void
  def get_clients (page = nil, max = nil, opts={})
    query_param_keys = [:page,:max]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'page' => page,
      :'max' => max
      
    }.merge(opts)

    #resource path
    path = "/get-clients.json".sub('{format}','json')
    
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

  # Get a list of transactions for an account.
  # 
  # @param id Transaction ID
  # @return void
  def get_transaction (id = nil, opts={})
    query_param_keys = [:id]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'id' => id
      
    }.merge(opts)

    #resource path
    path = "/get-transaction.json".sub('{format}','json')
    
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

  # Get a list of transactions for an account.
  # 
  # @param client_id Only retrieve records for a particular client
  # @param start A timestamp to start the report from
  # @param _end A timestamp to end the report at
  # @param page Page number, for pagination
  # @param max Maximum results returned per page
  # @return void
  def get_transactions (client_id = nil, start = nil, _end = nil, page = nil, max = nil, opts={})
    query_param_keys = [:client_id,:start,:_end,:page,:max]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'client_id' => client_id,
      :'start' => start,
      :'_end' => _end,
      :'page' => page,
      :'max' => max
      
    }.merge(opts)

    #resource path
    path = "/get-transactions.json".sub('{format}','json')
    
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
end
