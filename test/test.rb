#!/usr/bin/env ruby
$:.push File.expand_path("../../lib", __FILE__)
require "time_limits"

begin
  TimeLimits::Timeout.in_time { sleep 2 }
  raise "Failed"
rescue Timeout::Error => x
  puts "Ok"
end

ok = TimeLimits::Timeout.in_time_or_else( 1, :return => true ) { sleep 2 }
raise unless ok == true
puts "Ok"
