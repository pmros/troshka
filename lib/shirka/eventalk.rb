require 'ostruct'

module Shirka
  module Eventalk
    def fire(signal, msg=nil, receivers=nil)
      if receivers.nil?
        receivers = watchers
      else
        receivers = Array(receivers)
      end
  
      receivers.each do |w|
        method = "on_#{signal}".to_sym
        if w.respond_to? method
          e = OpenStruct.new
          e.signal =  signal
          e.msg = msg
          e.sender = self
          w.send method, e
        end
      end
    end
  
    def forward(event, receivers=nil)
      fire event.signal, event.msg, receivers
    end
  
    def watchers
      @watchers ||= []
    end
  
    def add_watcher(obj)
      @watchers ||= []
      @watchers << obj
    end
  
    def watch(obj)
      obj.add_watcher self
    end
  end
end