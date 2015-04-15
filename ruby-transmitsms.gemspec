# -*- encoding: utf-8 -*-
#$:.push File.expand_path("../lib", __FILE__)
#require "swagger/version"

Gem::Specification.new do |s|
  s.metadata["allowed_push_host"] = "http://localhost:8808"

  s.name        = "ruby-transmitsms"
  s.version     = "0.0.1"
  s.authors     = ["Jeremiah John Macariola"]
  s.email       = ["maiah@burstsms.com"]
  s.homepage    = "http://burstsms.com.au"
  s.summary     = "Ruby SDK"
  s.description = "Ruby gem to easily access TransmitSMS RESTful APIs"

  s.add_runtime_dependency 'typhoeus', '>=0.2.1'
  s.add_runtime_dependency 'addressable', '>=2.2.4'
  s.add_runtime_dependency 'json', '>=1.4.6'

  s.add_development_dependency 'rspec', '>=2.5.0'
  s.add_development_dependency 'vcr', '>=1.5.1'
  s.add_development_dependency 'webmock', '>=1.6.2'
  s.add_development_dependency 'autotest'  
  s.add_development_dependency 'autotest-rails-pure'
  s.add_development_dependency 'autotest-growl'
  s.add_development_dependency 'autotest-fsevent'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib", "models"]
end
