if RUBY_VERSION =~ /^1\.8/ then
  require "rubygems"
  require "system_timer"
end

module TimeLimits
  module Timeout
    
    if RUBY_VERSION =~ /^1\.8/ then
      
      def in_time( duration = 1, &block )
        SystemTimer.timeout_after(duration) { yield }
      end
    
    else
      
      def in_time( duration = 1, &block )
        ::Timeout::timeout(duration) { yield }
      end
      
    end
    
    # options :rescue value
    def in_time_or_else( duration = 1, options = {}, &block )
      in_time( duration, &block )
    rescue ::Timeout::Error => x
      return options[:rescue]
    end
    
    extend Timeout
    
  end
end
