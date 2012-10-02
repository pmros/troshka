module Shirka
  module Qt

    class TreeItemController < ::Shirka::Controller
      def initialize(app, parent=nil, data=nil)    
        @app = app
        @parent = parent
        @components = Components.new
        @root = data[:root]
        @data = data[:text]
        watch @app
        init @data
      end

      def init(data)
        data.each { |i| add_item i } if data.respond_to? :each
      end
      
      def view_class
        name = self.class.to_s.sub(/Controller$/, 'View')
        Object.const_get name rescue ::Shirka::Qt::TreeItemView
      end
      
      def view
        @view ||= view_class.new self, data
      end
      
      def add_item(text='', controller_class=nil)
        controller_class ||= item_controller_class
        comp = controller_class.new app, self, {text: text, root: @root}
        add_component comp
      end
      
      def item_controller_class
        self.class rescue ::Shirka::Qt::TreeItemController
      end      
      
      def on_component_adding(data=nil)
        @root.on_component_added self, id
      end
      
      def id 
        view.id
      end
            
      def on_double_clicked
      end
    end
    
  end
end