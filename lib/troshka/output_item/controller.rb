class OutputItemController < Shirka::Qt::TreeItemController
    def init(data)
      add_item data[:code], OutputItemCodeController
      if data[:exception].nil?
        add_item data[:obj].inspect, OutputItemObjController
        add_item data[:output], OutputItemOutputController unless data[:output].to_s.empty?
      else
        add_item data[:exception], OutputItemExceptionController        
      end
    end
    
    def view
      @view ||= view_class.new self, data[:time]
    end
end