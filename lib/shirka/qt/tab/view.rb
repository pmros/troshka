module Shirka
  module Qt
    
    class TabView < ::Shirka::View
      def widget_class
        Qt::TabWidget
      end
      
      def on_view_adding(view, slot=nil)
        widget.addTab view.widget, view.label
      end
      
    end

  end
end