class EditorView < Shirka::View
  def widget_class
    Qt::TextEdit
  end
  
  def build(widget)
    v = self
    
    widget.define_singleton_method :keyPressEvent do |evt|
      if evt.key==Qt::Key_Return && evt.modifiers==Qt::Control_Modifier
        v.controller.code_entering toPlainText
      else
        super evt
      end
    end #kewyPressEvent
  end

  def on_code_evaluated(e)
    widget.setPlainText ""
  end

  def replace_code(code)
    widget.setPlainText code
    widget.moveCursor Qt::TextCursor::End
    widget.setFocus
  end
      
end