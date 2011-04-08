require "time_limits/timeout" # TimeLimits::Timeout.timeout( duration = 1.second, &block )
require "time_limits/class_methods" # time_limit timeout, *method_names, :rescue => value

module TimeLimits
  class << self
    def included( base )
      base.send( :extend, ClassMethods )
    end
  end
end
