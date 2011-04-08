module TimeLimits
  module ClassMethods
    
    def time_limit( timeout, *names )
      raise unless timeout.to_i > 0
      options = names.last.kind_of?(Hash) ? names.pop : {}
      raise unless names.size > 0
      names.each do |name|
        original = instance_method(name)
        if options.has_key?(:rescue) then
          rescue_value = options[:rescue]
          define_method( name ) do |*args| # &block not supported in 1.8
            TimeLimits::Timeout.in_time( timeout ) do
              begin
                original.bind(self).call( *args ) # &block not supported in 1.8
              rescue ::Timeout::Error
                rescue_value
              end
            end
          end
        else
          define_method( name ) do |*args| # &block not supported in 1.8
            TimeLimits::Timeout.in_time( timeout ) do
              original.bind(self).call( *args ) # &block not supported in 1.8
            end
          end
        end
      end
    end
    
  end
end
