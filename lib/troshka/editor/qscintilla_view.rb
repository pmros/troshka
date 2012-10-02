require_relative 'qxscintilla'

class EditorView < Shirka::View
  def widget_class
    Qx::Scintilla
  end
  
  def build(widget)
    widget.setAutoIndent true
    widget.setIndentationGuides true
    widget.setIndentationWidth 2
    widget.setFolding ::Qsci::Scintilla::PlainFoldStyle
    widget.setLexer ::Qsci::LexerRuby.new
    widget.setMarginWidth 1, 0 
    
    # Events
    widget.key_pressed do |e|
      # Autocompletion hotkey
      if e.key==Qt::Key_Space && e.modifiers==Qt::Control_Modifier
        controller.autocompletion_list_requesting \
          widget.current_line_text, widget.current_column_number rescue pust $!
        e.continue = false
      # Enter code hotkey
      elsif e.key==Qt::Key_Return && e.modifiers==Qt::Control_Modifier
        controller.code_entering widget.text
        e.continue = false
      end
    end #key_pressed
    
    widget.user_list_activated do |id, text|
      controller.autocompletion_item_selecting text
    end
    
  end #build
  
  def autocompletion_list_requested(list, selection)
    widget.move_cursor(column: selection.first)
    widget.show_user_list 1, list
    widget.move_cursor(column: selection[1])
  end
  
  def autocompletion_item_selected(line, cursor)
    widget.replace_line line
    widget.move_cursor(column: cursor)
  end
  
  def on_code_evaluated(e)
    widget.text = ""
  end
  
  def replace_code(code)
    widget.text = code
    widget.move_cursor_to_end
    widget.setFocus
  end
end