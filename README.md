ruby-transmitsms
================

Ruby gem to easily access TransmitSMS RESTful APIs

[![Gem Version](https://badge.fury.io/rb/ruby-transmitsms.svg)](http://badge.fury.io/rb/ruby-transmitsms)
[![Build Status](https://drone.io/github.com/transmitsms/ruby-transmitsms/status.png)](https://drone.io/github.com/transmitsms/ruby-transmitsms/latest)

### Sample Usage
```ruby
require 'ruby-transmitsms'

# Create new Sms instance using API key and secret
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

Instance method parameter documentation: [SmsApi Method Params Doc](http://support.burstsms.com/hc/en-us/sections/200421838-SMS)

* send
* format_number
* get_sms
* get_sms_responses
* get_user_sms_responses
* get_sms_sent
* cancel_sms
 
### ListsApi

Instance method parameter documentation: [ListsApi Method Params Doc](http://support.burstsms.com/hc/en-us/sections/200423538-Lists)

* remove_list
* get_list
* get_lists
* add_list
* add_to_list
* delete_from_list
* optout_list_member
* edit_list_member

### NumbersApi

Instance method parameter documentation: [NumbersApi Method Params Doc](http://support.burstsms.com/hc/en-us/sections/200434387-Numbers)

* get_number
* get_numbers
* lease_number

### EmailApi

Instance method parameter documentation: [EmailApi Method Params Doc](http://support.burstsms.com/hc/en-us/sections/200434397-Email-SMS)

* add_email
* delete_email

### KeywordsApi

Instance method parameter documentation: [KeywordsApi Method Params Doc](http://support.burstsms.com/hc/en-us/sections/200434407-Keywords)

* add_keyword
* edit_keyword
* get_keywords

### ResellersApi

Instance method parameter documentation: [ResellersApi Method Params Doc](http://support.burstsms.com/hc/en-us/sections/200423648-Resellers)

* get_client
* get_clients
* add_client
* edit_client
* get_transactions
* get_transaction

### AccountApi

Instance method parameter documentation: [AccountApi Method Params Doc](http://support.burstsms.com/hc/en-us/sections/200204619-Account)

* get_balance
