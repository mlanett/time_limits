#!/usr/bin/env ruby
$:.push File.expand_path("../../lib", __FILE__)
#require "rubygems"
#require "ruby-debug"
require "time_limits"

class X
  def slow() sleep(2); end
  def slow2() sleep(2); end
  def slow3() sleep(3); end
  def slow4() sleep(4); end
  include TimeLimits
  time_limit 1, :slow, :slow2, :slow3, :slow4
end

begin
  X.new.slow2
  raise "Failed"
rescue Timeout::Error => x
  puts "Ok"
end

class X2
  def slow() sleep(2); true; end
  def slow2() sleep(2); end
  include TimeLimits
  time_limit 1, :slow, :slow2, :rescue => false
end

ok = X2.new.slow2
raise "Failed" unless ok == false

begin
  TimeLimits::Timeout.in_time { sleep 2 }
  raise "Failed"
rescue Timeout::Error => x
  puts "Ok"
end

ok = TimeLimits::Timeout.in_time_or_else( 1, :rescue => false ) { sleep 2 }
raise unless ok == false
puts "Ok"
