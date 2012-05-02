module Troshka

  class App
    attr_reader :shell
    
    def initialize
      @qt_app = Qt::Application.new []
        
      @editor = Editor.new
      @editor.app = self
      
      @output = Output.new
      @output.app = self
      
      @detail = Detail.new
      @detail.app = self
      
      @splitterh = Qt::Splitter.new
      @splitterv = Qt::Splitter.new
      @shell = Shell.new
    end
    
    def complete(word, line)
      Bond.agent.call word, line
    end
    
    def run(text)
      out = @shell.run text
      @editor.text = ""
      out[:text] = text
      @output.add out
      @output.scrollToBottom
      @detail.view out[:obj]
    end
    
    def replace_code(text)
      @editor.text = text
      @editor.move_to_end
      @editor.setFocus
    end
    
    def start
      Bond.start
      
      @splitterv.set_orientation Qt::Horizontal
      @splitterh.set_orientation Qt::Vertical
      @splitterh.resize 600,400
      
      @splitterh.add_widget @splitterv
      @splitterv.add_widget @output
      @splitterv.add_widget @detail
      
      @splitterh.add_widget @editor
      @editor.setFocus
      @splitterh.show
  
      @qt_app.exec    
    end
  end

end