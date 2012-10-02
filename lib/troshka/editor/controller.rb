require_relative 'shell'
require_relative 'line'

class EditorController < Shirka::Controller    
  def on_starting(e)
    watch app.components[:output]
  end
  
  def shell
    @shell ||= Shell.new
  end
  
  def completer
    if @completer.nil?
      begin
        require_relative 'bond_completer'
      rescue LoadError
        require_relative 'completer'
      ensure
        @completer = Completer.new
      end
    end
    @completer
  end
  
  def view_class
    if @view_class.nil?
      begin
        require_relative 'qscintilla_view'
      rescue LoadError
        require_relative 'qtextedit_view'
      ensure
        @view_class = EditorView
      end
    end
    @view_class
  end 
  
  #Events
  
  def code_entering(text)
    time_begin = Time.now
    result = shell.run text
    time_end = Time.now
    result[:time] = (time_end - time_begin) * 1000
    fire :code_evaluated, result
  end
  
  def autocompletion_list_requesting(text, cursor)      
    @line = Line.new text, cursor
    list = completer.complete @line.text(@line.word), @line.text
    
    unless list.empty?
      prefix = list.first.dup
      prefix.chop! while @line.text.rindex(prefix).nil?
      @line.selection = [cursor - prefix.size, cursor]
      
      view.autocompletion_list_requested list, @line.selection
    end
  end
  
  def autocompletion_item_selecting(item)
    @line.replace_selection_text item
    view.autocompletion_item_selected @line.text, @line.cursor
  end    
  
  def on_code_selected(e)
    view.replace_code e.msg
  end
  
end