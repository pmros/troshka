module Shirka
  class Controller
    include Eventalk
  
    attr_writer :view
    attr_reader :components
    attr_reader :app
    attr_accessor :parent
    attr_reader :data
    
    def initialize(app, parent=nil, data=nil)    
      @app = app
      @parent = parent
      @components = Components.new
      @data = data
      watch @app
      init data
    end
    
    def init(data)
    end
    
    def view_class
      name = self.class.to_s.sub(/Controller$/, 'View')
      Object.const_get name rescue ::Shirka::View
    end    
    
    def view
      @view ||= view_class.new self
    end

    def item_controller_class
      name = self.class.to_s.sub(/Controller$/, 'ItemController')
      Object.const_get name rescue ::Shirka::Controller
    end
      
    def add_item(text='', controller_class=nil)
      controller_class ||= item_controller_class
      comp = controller_class.new app, self, text
      add_component comp
    end
            
    def add_component(component, slot=nil)
      component.parent = self
      @components.add slot, component
      component.on_component_adding  
      view.on_view_adding component.view, slot     
    end  
    
    def on_component_adding(data=nil)
    end
    
    def on_component_added(data=nil)
    end
    
  end
end