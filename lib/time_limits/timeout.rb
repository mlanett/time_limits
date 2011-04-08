if RUBY_VERSION =~ /^1\.8/ then
  require "rubygems"
  require "system_timer"
end

module TimeLimits
  module Timeout
    
    if RUBY_VERSION =~ /^1\.8/ then
      
      def timeout( duration = 1, &block )
        SystemTimer.timeout_after(duration) { yield }
      end
    
    else
      
      def timeout( duration = 1, &block )
        Timeout::timeout(duration) { yield }
      end
      
    end
    
    extend Timeout
    
  end
end
