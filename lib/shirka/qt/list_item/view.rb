module Shirka
  module Qt
    
    class ListItemView < ::Shirka::View
      def widget_class
        ::Qt::ListWidgetItem
      end
      
      def build(widget)       
        widget.setText data
      end
      
      def id
        widget.object_id
      end
    end

  end
end