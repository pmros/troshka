class MainView < ::Shirka::View
  def widget
    return @widget unless @widget.nil?
    
    @widget = Qt::MainWindow.new
    
    @splitter1 = Qt::Splitter.new
    @splitter1.set_orientation Qt::Horizontal
    
    @splitter2 = Qt::Splitter.new
    @splitter2.set_orientation Qt::Vertical

    @splitter3 = Qt::Splitter.new
    @splitter3.set_orientation Qt::Vertical

    #@main = Qt::TabWidget.new
    #@info = Qt::TabWidget.new
    
    
    @splitter1.add_widget @splitter2
    #@splitter2.add_widget @main
    
    @splitter1.add_widget @splitter3
    #@splitter3.add_widget @info
        
    @widget.setCentralWidget @splitter1    
    @widget
  end

  
  def on_view_adding(view, slot=nil)    
    widget
    case slot
    when :editor
      @splitter2.add_widget view.widget
      view.widget.setFocus
    when :info
      #@info.addTab view.widget, view.label
      @splitter3.add_widget view.widget
    when :main
      @splitter2.add_widget view.widget
    when :info2
      @splitter3.add_widget view.widget
    end
  end
  
  def show
    widget.show
  end
end
