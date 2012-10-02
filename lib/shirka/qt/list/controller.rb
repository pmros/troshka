module Shirka
  module Qt

    class ListController < ::Shirka::Controller
      def init(data)
        @item_ids = {}        
        data.each { |i| add_item i }
      end

      def add_item(text='', controller_class=nil)
        controller_class ||= item_controller_class
        comp = controller_class.new app, self, text
        add_component comp
      end
      
      def view_class
        name = self.class.to_s.sub(/Controller$/, 'View')
        Object.const_get name rescue ::Shirka::Qt::ListView
      end  
            
      def item_controller_class
        name = self.class.to_s.sub(/Controller$/, 'ItemController')
        Object.const_get name rescue ::Shirka::Qt::ListItemController
      end
      
      def on_double_clicked(id)
        controller = @item_ids[id]
        controller.on_double_clicked
      end
        
      def on_component_added(component, data=nil)
        id = data
        @item_ids[id] = component
      end
    end

  end
end