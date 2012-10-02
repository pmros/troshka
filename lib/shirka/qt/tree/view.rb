module Shirka
  module Qt

    class TreeView < ::Shirka::View
      def widget_class
        ::Qt::TreeWidget
      end
      
      def build(widget)
        #Double click event
        widget.connect(SIGNAL "itemDoubleClicked(QTreeWidgetItem*,int)") do |item, column|
          controller.on_double_clicked item.object_id
        end
      end
      
      def style(widget)
        widget.header.hide
      end
  
      def on_view_adding(view, slot=nil)
        widget.addTopLevelItem view.widget
      end      
    end
    
  end
end