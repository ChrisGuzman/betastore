class Subscription < ActiveRecord::Base
end

class Thing
  def method_missing(name, *args)
    puts "Tried to call #{name} with the arguments #{args.inspect}"
  end
end
