module Shirka
  module Qt

    class TreeItemView < ::Shirka::View
      def widget_class
        ::Qt::TreeWidgetItem
      end
      
      def build(widget)       
        widget.setText 0, data.to_s
      end
      
      def id
        widget.object_id
      end
      
      def on_view_adding(view, slot=nil)
        widget.insertChild widget.childCount, view.widget
      end 
    end
        
  end
end