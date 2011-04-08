#!/usr/bin/env ruby
$:.push File.expand_path("../../lib", __FILE__)
require "time_limits"

begin
  TimeLimits::Timeout.timeout { sleep 2 }
  raise "Failed"
rescue Timeout::Error => x
  puts "Ok"
end
