# -*- encoding: utf-8 -*-
#$:.push File.expand_path("../lib", __FILE__)
#require "swagger/version"

Gem::Specification.new do |s|
  #s.metadata["allowed_push_host"] = "https://rubygems.org"

  s.name        = "ruby-transmitsms"
  s.version     = '1.0.0' #"0.1.1"
  s.authors     = ["Transmitsms Developers"]
  s.email       = ["transmitsms@gmail.com"]
  s.homepage    = "http://transmitsms.com"
  s.summary     = "Ruby SDK"
  s.description = "Ruby gem to easily access TransmitSMS RESTful APIs"

  s.add_runtime_dependency 'typhoeus', '>=0.2.1'
  s.add_runtime_dependency 'addressable', '>=2.2.4' #, '>=2.2.4'
  s.add_runtime_dependency 'json_pure', '=1.8.3' #'json', '>=1.4.6'

  s.add_development_dependency 'rspec', '>=2.5.0'
  s.add_development_dependency 'rspec-mocks'
  s.add_development_dependency 'vcr', '>=2.9.3'
  s.add_development_dependency 'webmock', '>=1.21.0'
#  s.add_development_dependency 'autotest'  
#  s.add_development_dependency 'autotest-rails-pure'
#  s.add_development_dependency 'autotest-growl'
#  s.add_development_dependency 'autotest-fsevent'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib", "models"]
end
