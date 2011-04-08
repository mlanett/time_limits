# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "time_limits/version"

Gem::Specification.new do |s|
  s.name        = "time_limits"
  s.version     = TimeLimits::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mark Lanett"]
  s.email       = ["mark.lanett@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Apply timeouts to methods via meta programming}
  
  s.rubyforge_project = "time_limits"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
