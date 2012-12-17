$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smoke_signal_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smoke_signal_client"
  s.version     = SmokeSignalClient::VERSION
  s.authors     = ["Rodrigo Sol"]
  s.email       = ["rodrigosol@rarolabs.com.br"]
  s.homepage    = "http://www.github.com.br/rarolabs/smoke_signal_client"
  s.summary     = "This is a client for the brand new multiple notifications system called smoke signal"
  s.description = "This gem allows rails apps to communicate with a SmokeSignal Server"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"

end
