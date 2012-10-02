module Shirka
  module Qt

    class TreeController < ::Shirka::Controller    
      def init(data)
        @item_ids = {}        
        data.each { |i| add_item i } if data.respond_to? :each
      end
      
      def view_class
        name = self.class.to_s.sub(/Controller$/, 'View')
        Object.const_get name rescue ::Shirka::Qt::TreeView
      end
      
      
      def item_controller_class
        name = self.class.to_s.sub(/Controller$/, 'ItemController')
        Object.const_get name rescue ::Shirka::Qt::TreeItemController
      end
        
      def add_item(text='', controller_class=nil)
        controller_class ||= item_controller_class
        comp = controller_class.new app, self, {text: text, root: self}
        add_component comp
      end
    
      def on_double_clicked(id)
        controller = @item_ids[id]
        controller.on_double_clicked
      end
        
      def on_component_added(component, data=nil)
        id = data
        @item_ids[id] = component
        watch component
      end
    end
    
  end
end