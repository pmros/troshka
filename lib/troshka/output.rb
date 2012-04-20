module Troshka
  
  class Output < Qt::ListWidget
    attr_accessor :app
    
    def initialize
      super
      build
    end
    
    def item_double_click(&block)
      connect(SIGNAL "itemDoubleClicked(QListWidgetItem*)") {|item| block.(item)}
    end
    
    def add(obj)
      iCode = Qt::ListWidgetItem.new
      iCode.setText obj[:text]
      iCode.setData Qt::UserRole, Qt::Variant.new("code")
      iCode.setForeground Qt::Brush.new(Qt::Color.new 0, 0, 255)
      self.addItem iCode
      
      if obj[:exception]
        iEx = Qt::ListWidgetItem.new
        iEx.setText "#{obj[:exception].class}: #{obj[:exception].message}"
        iEx.setData Qt::UserRole, Qt::Variant.new("exception")
        iEx.setBackground Qt::Brush.new(Qt::Color.new 255, 0, 0)
        self.addItem iEx  
      else
        unless obj[:output].empty?
          obj[:output].chop! if obj[:output][-1]=="\n"
          iOut = Qt::ListWidgetItem.new
          iOut.setText obj[:output]
          iOut.setBackground Qt::Brush.new(Qt::Color.new 229, 229, 255)
          iOut.setData Qt::UserRole, Qt::Variant.new("output")
          self.addItem iOut
        end
        
        obj[:obj] = "nil" if obj[:obj].nil?        
        iObj = Qt::ListWidgetItem.new
        iObj.setText obj[:obj].to_s
        iObj.setData Qt::UserRole, Qt::Variant.new("obj")
        iObj.setBackground Qt::Brush.new(Qt::Color.new 255, 255, 229)
        self.addItem iObj
      end    
      
      self.item(self.count-1).setSelected true  
    end
    
    def build
      item_double_click do |item|
        if item.data(Qt::UserRole).toString == "code"
          @app.replace_code item.text
        end
      end
    end
  end

end