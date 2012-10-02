module Shirka
  module Qt
    
    class ListView < ::Shirka::View
      def widget_class
        ::Qt::ListWidget
      end
      
      def build(widget)
        #Double click event
        widget.connect(SIGNAL "itemDoubleClicked(QListWidgetItem*)") do |item|
          controller.on_double_clicked item.object_id
        end
      end
      
      def on_view_adding(view, slot=nil)
        widget.addItem view.widget
        widget.scrollToBottom
      end
    end

  end
end