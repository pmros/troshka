module Shirka
  module Qt
    
    class ListItemController < ::Shirka::Controller
      def init(data)
        @text = data.to_s
      end

      def view_class
        name = self.class.to_s.sub(/Controller$/, 'View')
        Object.const_get name rescue ::Shirka::Qt::ListItemView
      end
      
      def view
        @view ||= view_class.new self, @text
      end
      
      def id 
        view.id
      end
      
      def on_component_adding(data=nil)
        parent.on_component_added self, id
      end
      
      def on_double_clicked
      end
    end

  end
end