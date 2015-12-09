require "uri"

class ListsApi
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


  # Create a new list including the ability to add custom fields.
  # 
  # @param name A unique name for the list
  # @param field_1 Custom field value 1
  # @param field_2 Custom field value 2
  # @param field_3 Custom field value 3
  # @param field_4 Custom field value 4
  # @param field_5 Custom field value 5
  # @param field_6 Custom field value 6
  # @param field_7 Custom field value 7
  # @param field_8 Custom field value 8
  # @param field_9 Custom field value 9
  # @param field_10 Custom field value 10
  # @return void
  def add_list (name = nil, field_1 = nil, field_2 = nil, field_3 = nil, field_4 = nil, field_5 = nil, field_6 = nil, field_7 = nil, field_8 = nil, field_9 = nil, field_10 = nil, opts={})
    query_param_keys = [:name,:field_1,:field_2,:field_3,:field_4,:field_5,:field_6,:field_7,:field_8,:field_9,:field_10]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'name' => name,
      :'field_1' => field_1,
      :'field_2' => field_2,
      :'field_3' => field_3,
      :'field_4' => field_4,
      :'field_5' => field_5,
      :'field_6' => field_6,
      :'field_7' => field_7,
      :'field_8' => field_8,
      :'field_9' => field_9,
      :'field_10' => field_10
      
    }.merge(opts)

    #resource path
    path = "/add-list.json".sub('{format}','json')
    
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

  # Add a member to a list.
  # 
  # @param list_id ID of the list to add to
  # @param msisdn Mobile number of the member
  # @param first_name First name of the member
  # @param last_name Last name of the member
  # @param field_1 Custom field value 1
  # @param field_2 Custom field value 2
  # @param field_3 Custom field value 3
  # @param field_4 Custom field value 4
  # @param field_5 Custom field value 5
  # @param field_6 Custom field value 6
  # @param field_7 Custom field value 7
  # @param field_8 Custom field value 8
  # @param field_9 Custom field value 9
  # @param field_10 Custom field value 10
  # @return void
  def add_to_list (list_id = nil, msisdn = nil, first_name = nil, last_name = nil, field_1 = nil, field_2 = nil, field_3 = nil, field_4 = nil, field_5 = nil, field_6 = nil, field_7 = nil, field_8 = nil, field_9 = nil, field_10 = nil, opts={})
    query_param_keys = [:list_id,:msisdn,:first_name,:last_name,:field_1,:field_2,:field_3,:field_4,:field_5,:field_6,:field_7,:field_8,:field_9,:field_10]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'list_id' => list_id,
      :'msisdn' => msisdn,
      :'first_name' => first_name,
      :'last_name' => last_name,
      :'field_1' => field_1,
      :'field_2' => field_2,
      :'field_3' => field_3,
      :'field_4' => field_4,
      :'field_5' => field_5,
      :'field_6' => field_6,
      :'field_7' => field_7,
      :'field_8' => field_8,
      :'field_9' => field_9,
      :'field_10' => field_10
      
    }.merge(opts)

    #resource path
    path = "/add-to-list.json".sub('{format}','json')
    
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

  # Remove a member from one list or all lists.
  # 
  # @param list_id ID of the list to remove from. If set to 0 (zero) the member will be removed from all lists.
  # @param msisdn Mobile number of the member
  # @return void
  def delete_from_list (list_id = nil, msisdn = nil, opts={})
    query_param_keys = [:list_id,:msisdn]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'list_id' => list_id,
      :'msisdn' => msisdn
      
    }.merge(opts)

    #resource path
    path = "/delete-from-list.json".sub('{format}','json')
    
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

  # Edit a member of a list.
  # 
  # @param list_id ID of the list the member belongs to
  # @param msisdn Mobile number of the member to edit
  # @param first_name First name of the member
  # @param last_name Last name of the member
  # @param field_1 Custom field value 1
  # @param field_2 Custom field value 2
  # @param field_3 Custom field value 3
  # @param field_4 Custom field value 4
  # @param field_5 Custom field value 5
  # @param field_6 Custom field value 6
  # @param field_7 Custom field value 7
  # @param field_8 Custom field value 8
  # @param field_9 Custom field value 9
  # @param field_10 Custom field value 10
  # @return void
  def edit_list_member (list_id = nil, msisdn = nil, first_name = nil, last_name = nil, field_1 = nil, field_2 = nil, field_3 = nil, field_4 = nil, field_5 = nil, field_6 = nil, field_7 = nil, field_8 = nil, field_9 = nil, field_10 = nil, opts={})
    query_param_keys = [:list_id,:msisdn,:first_name,:last_name,:field_1,:field_2,:field_3,:field_4,:field_5,:field_6,:field_7,:field_8,:field_9,:field_10]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'list_id' => list_id,
      :'msisdn' => msisdn,
      :'first_name' => first_name,
      :'last_name' => last_name,
      :'field_1' => field_1,
      :'field_2' => field_2,
      :'field_3' => field_3,
      :'field_4' => field_4,
      :'field_5' => field_5,
      :'field_6' => field_6,
      :'field_7' => field_7,
      :'field_8' => field_8,
      :'field_9' => field_9,
      :'field_10' => field_10
      
    }.merge(opts)

    #resource path
    path = "/edit-list-member.json".sub('{format}','json')
    
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

  # Get information about a list and its members.
  # 
  # @param list_id List ID
  # @param members Types of members to return. (active, inactive, all, none)
  # @param page Page number, for pagination
  # @param max Maximum results returned per page
  # @return void
  def get_list (list_id = nil, members = nil, page = nil, max = nil, opts={})
    query_param_keys = [:list_id,:members,:page,:max]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'list_id' => list_id,
      :'members' => members,
      :'page' => page,
      :'max' => max
      
    }.merge(opts)

    #resource path
    path = "/get-list.json".sub('{format}','json')
    
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

  # Get the metadata of all your lists.
  # 
  # @param page Page number, for pagination
  # @param max   Maximum results returned per page
  # @return void
  def get_lists (page = nil, max = nil, opts={})
    query_param_keys = [:page,:max]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'page' => page,
      :'max' => max
      
    }.merge(opts)

    #resource path
    path = "/get-lists.json".sub('{format}','json')
    
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

  # Opt a user out of one list or all lists.
  # 
  # @param list_id ID of the list to opt the user out of. Set this to 0 (zero) to opt out of all of your lists.
  # @param msisdn Mobile number of the member to opt out
  # @return void
  def optout_list_member (list_id = nil, msisdn = nil, opts={})
    query_param_keys = [:list_id,:msisdn]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'list_id' => list_id,
      :'msisdn' => msisdn
      
    }.merge(opts)

    #resource path
    path = "/optout-list-member.json".sub('{format}','json')
    
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

  # Delete a list and its members.
  # 
  # @param list_id ID of the list to remove.
  # @return void
  def remove_list (list_id = nil, opts={})
    query_param_keys = [:list_id]
    headerParams = {}

    
    
    # set default values and merge with input
    options = {
      :'list_id' => list_id
      
    }.merge(opts)

    #resource path
    path = "/remove-list.json".sub('{format}','json')
    
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
