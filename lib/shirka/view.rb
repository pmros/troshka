module Shirka
  class View  
    include Eventalk
    
    attr_reader :controller
    attr_reader :data
    attr_reader :label
    
    def initialize(controller, data=nil)
      @controller = controller
      @data = data
      watch @controller
      init data
    end
  
    def init(data)
    end
  
    def on_view_adding(view, slot=nil)
    end

    def on_view_added(view, slot=nil)
    end
        
    def widget_class
    end
    
    def widget
      return @widget unless @widget.nil?
      
      @widget = widget_class.new
      build @widget
      style @widget
      @widget   
    end
       
    def on_component_added(data=nil)
    end
            
    def build(widget)       
    end
    
    def style(widget)
    end  
    
  end
end