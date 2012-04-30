module Troshka
  
  class Editor < Qt::TextEdit
    attr_accessor :app
    
    def keyPressEvent(evt)
      if evt.key==Qt::Key_Return && evt.modifiers==Qt::Control_Modifier
        @app.run text
      else
        super evt
      end
    end
    
    def text
      toPlainText
    end
    
    def text=(str)
      setPlainText(str)
    end
    
    def move_to_end
      moveCursor Qt::TextCursor::End
    end
  end

end
