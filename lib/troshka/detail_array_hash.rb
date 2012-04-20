module Troshka
  
  class DetailArrayHash < Qt::TreeWidget
    attr_accessor :app
    
    def initialize
      super
      self.setHeaderLabels ['Index', 'Value']
    end
    
    def view(obj)
      self.clear
      viewObject obj
    end
    
    private
      
    def viewObject(obj, idx=nil, parent=nil)
      case obj
      when Array
        viewArray obj, idx, parent
      when Hash
        viewHash obj, idx, parent
      else
        viewAnything obj, idx, parent
      end
    end
    
    def insert(item, parent=nil)
      if not parent.is_a? Qt::TreeWidgetItem
        self.addTopLevelItem item
      else
        parent.insertChild parent.childCount, item
      end  
    end
    
    def viewArray(obj, idx, parent)
      if parent.nil?
        item = :root
      else
        item = Qt::TreeWidgetItem.new
        item.setText 0, idx.to_s
        item.setText 1, "Array #{obj.size} items"
        item.setForeground 1, Qt::Brush.new(Qt::Color.new 128, 128, 128)
        insert item, parent
      end
      
      obj.each_with_index do |o,idx|
        viewObject o, idx, item 
      end
      
      item
    end
    
    def viewHash(obj, idx, parent)
      if parent.nil?
        item = :root
      else
        item = Qt::TreeWidgetItem.new
        item.setText 0, idx.to_s
        item.setText 1, "Hash #{obj.size} items"
        brush = Qt::Brush.new(Qt::Color.new 229, 229, 255)
        item.setBackground 0, brush
        item.setBackground 1, brush
        insert item, parent
      end
      
      obj.each do |k,v|
        viewObject v, k, item 
      end
      
      item
    end  
    
    def viewAnything(obj, idx, parent=nil)
      item = Qt::TreeWidgetItem.new
      item.setText 0, idx.to_s
      item.setText 1, obj.to_s
      item.setForeground 1, Qt::Brush.new(Qt::Color.new 0, 0, 229)
      insert item, parent
      item
    end
    
  end

end