module Troshka
  
  class Detail < Qt::StackedWidget
    attr_accessor :app
    
    def initialize
      super
      @w = [DetailArrayHash.new, DetailAnything.new]
      @w.each {|i| addWidget i}
      self.setCurrentIndex 1
    end
    
    def view(obj)
      case obj
      when Array, Hash
        @w[0].view obj
        self.setCurrentIndex 0
      else
        @w[1].view obj
        self.setCurrentIndex 1
      end
    end
  end

end