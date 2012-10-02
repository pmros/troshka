class Line
  attr_accessor :cursor
  attr_accessor :selection
  
  def initialize(text, cursor=0)
    @text = text
    @cursor = cursor
  end

  def word(separator=/[ ,();]/)
    word_begin = @text.rindex(separator, cursor-1)+1 rescue 0
    word_begin = 0 if word_begin.nil?
    word_end = @text.index(separator, cursor)
    word_end = size if word_end.nil?
    
    [word_begin, word_end]
  end
  
  def text(range=nil)
    if range.nil?
      @text
    else
      if range[0]==range[1]
        ""
      else
      @text[range[0]..range[1]-1]
      end
    end
  end
  
  def replace_selection_text(text)
    pre = self.text [0, selection.first]
    post = self.text [selection[1], size]
    
    @text = "#{pre}#{text}#{post}"
    @cursor = selection[1] + text.size
    @selection = nil
  end
  
  def size
    @text.size
  end
end
