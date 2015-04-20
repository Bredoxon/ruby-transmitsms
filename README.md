ruby-transmitsms
================

Ruby gem to easily access TransmitSMS RESTful APIs

### Sample Usage
```ruby
require 'ruby-transmitsms'

# Create new Sms instance
sms = Sms.new("15eg266c832fb23c4d90f01055aef355", "bluebird")

# Send a message
response = sms.send("Hello, world", "61455123456")

# Show the result
puts response.code
puts response.body
```

### Installation
```sh
gem install ruby-transmitsms
```

### Installation with `bundler`'s Gemfile
gem "ruby-transmitsms"

## Development

### To install the required gems:
```sh
$ ./setup.sh
```

### To run  the tests:
```sh
$ ./runtest.sh
```
## API

### Sms

`initialize(api_key, api_secret)` - Sms object constructor.

params:
* api_key
* api_secret

`send(message, to, from, send_at, list_id, dlr_callback, reply_callback, validity, replies_to_email, from_shared)` - Send sms to the given `to` `param` or `list_id` parameter.

params:
* message
* to
* from
* send_at
* list_id
* dlr_callback
* reply_callback
* validity
* replies_to_email
* from_shared
