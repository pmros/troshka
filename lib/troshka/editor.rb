module Troshka
  
  class Editor < Qsci::Scintilla
    attr_accessor :app
    
    def initialize
      super
      build
    end
    
    def user_list_activated(&block)
      connect(SIGNAL "userListActivated(int, const QString)") {|id, text| block.(self,text)}
    end
    
    def keyPressEvent(x)
      if x.key==Qt::Key_Space && x.modifiers==Qt::Control_Modifier
        pos = column
        word = current_word      
        list = @app.complete(word[:word], current_line)
        unless list.empty?
          list.sort!
          
          hint = list.first.dup
          hint.chop! while current_line.rindex(hint).nil?
          @auto = word[:word_end]+1-hint.size, word[:word_end]
          
          setCursorPosition(line, word[:word_end]-hint.size)     
          show_user_list 1, list
          setCursorPosition(line, pos)
        end
      elsif x.key==Qt::Key_Return && x.modifiers==Qt::Control_Modifier
        @app.run text    
      else
        super x
      end
    end
    
    def position
      # SCI_GETCURRENTPOS
      SendScintilla(2008, 0, 0)
    end
    
    def line_end_position(line)
      # SCI_GETLINEENDPOSITION
      SendScintilla(2136, line, 0)
    end
    
    def move_to_end
      setCursorPosition lines, line_end_position(lines)
    end
    
    def select_word
      word = current_word
      setSelection line, word[:word_begin], line, word[:word_end]+1
    end
    
    def select_auto
      setSelection line, @auto.first, line, @auto.last + 1
    end
    
    def select_line
      setSelection line, 0, line, lineLength(line)
    end
    
    def line
      # SCI_LINEFROMPOSITION
      SendScintilla(2166,position,0)
    end
    
    def column
      #  SCI_GETCOLUMN = 2129
      SendScintilla(2129,position,0)
    end
    
    def insert_and_advance(text)
        insert text
        setCursorPosition(line, column + text.length)
    end
    
    def current_line
      text line
    end
    
    def current_word
      word_begin = current_line.rindex(word_separator, column-1)+1 rescue 0
      word_end = current_line.index(word_separator, column)-1 rescue current_line.size-1
      
      word = current_line[word_begin..word_end]
      {word_begin: word_begin, word_end: word_end, word: word}
    end
    
    def word_separator
      " "
    end
    
    def build
      @lexer = Qsci::LexerRuby.new
      self.setAutoIndent true
      self.setIndentationGuides true
      self.setIndentationWidth 2
      self.setFolding Qsci::Scintilla::PlainFoldStyle
      self.setLexer @lexer
      self.setMarginWidth 1, 0
      
      self.user_list_activated do |editor, text|
        editor.select_auto
        editor.replaceSelectedText text
      end
    end  
    
  end

end