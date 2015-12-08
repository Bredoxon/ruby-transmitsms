ruby-transmitsms
================

Ruby gem to easily access TransmitSMS RESTful APIs

[![Gem Version](https://badge.fury.io/rb/ruby-transmitsms.svg)](http://badge.fury.io/rb/ruby-transmitsms)
[![Build Status](https://drone.io/github.com/transmitsms/ruby-transmitsms/status.png)](https://drone.io/github.com/transmitsms/ruby-transmitsms/latest)

### Sample Usage
```ruby
require 'ruby-transmitsms'

# Create new Sms instance
sms = SmsApi.new("15eg266c832fb23c4d90f01055aef355", "bluebird")

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

### SmsApi

**initialize**(api_key, api_secret) - Sms object constructor.

params:
* `api_key`
* `api_secret`

**send**(message, to, from, send_at, list_id, dlr_callback, reply_callback, validity, replies_to_email, from_shared, countrycode) - Send sms to the given `to` param or `list_id` param.

params: See [send-sms](http://support.burstsms.com/hc/en-us/articles/202500828-send-sms) docs for parameter descriptions.

**format_number**(msisdn, countrycode) - Format given mobile number.

params: See [format-number](http://support.burstsms.com/hc/en-us/articles/203098949-format-number) for parameter descriptions.
