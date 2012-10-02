module Shirka
  module Qt
    
    class MultipanelView < ::Shirka::View
      def widget_class
        ::Qt::Widget
      end
      
      def build(widget) 
        widget.setLayout ::Qt::StackedLayout.new
      end
      
      def on_view_adding(view, slot=nil)
        layout = widget.layout
        current_panel = layout.currentWidget
        
        unless current_panel.nil?
          layout.removeWidget current_panel
          current_panel.close
        end
        
        layout.addWidget view.widget
        layout.update
        widget.show        
      rescue
        puts $!
      end      
    end

  end
end