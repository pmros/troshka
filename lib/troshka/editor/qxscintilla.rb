require "qscintilla"

module Qx
  class Scintilla < ::Qsci::Scintilla

    def initialize
      super
      connect(SIGNAL "userListActivated(int, const QString)") do |id, text|
        @autocompletion_activated.(id, text) rescue nil
      end
    end

    def keyPressEvent(event)
      e = OpenStruct.new
      e.key = event.key
      e.modifiers = event.modifiers
      e.continue = true

      @key_pressed.(e) rescue nil
      super event if e.continue
    end

    #Events
    def user_list_activated(&block)
      @autocompletion_activated = block
    end
    
    def key_pressed(&blk)
      @key_pressed = blk
    end

    # Operations
    def current_line_number
      # SCI_LINEFROMPOSITION
      SendScintilla(2166,pos,0)
    end

    def current_column_number
      #  SCI_GETCOLUMN = 2129
      SendScintilla(2129,pos,0)
    end

    def line_length(line)
      # SCI_GETLINEENDPOSITION
      SendScintilla(2136, line, 0)
    end
    
    def line_text(line_number)
      text line_number
    end
    
    def current_line_text
      line_text current_line_number
    end

    def select_line(line_number=nil)
      line ||= current_line_number
      setSelection line, 0, line, line_length(line)
    end

    def replace_line(text, line_number=nil)
      select_line
      replaceSelectedText text
    end

    def move_cursor(position)
      line, column = position[:line], position[:column]
      line ||= current_line_number
      column ||= current_column_number
      
      setCursorPosition line, column
    end
    
    def number_of_lines
      lines
    end
    
    def move_cursor_to_end
      setCursorPosition number_of_lines, line_length(number_of_lines)
    end
    
    def current_position
      {line: current_line_number, column: current_column_number}
    end
    
    def current_line
      {text: current_line_text, line_number: current_line_number}
    end
    
    private
    
    def pos
      # SCI_GETCURRENTPOS
      SendScintilla(2008, 0, 0)
    end

  end
end
