class OutputItemCodeController < Shirka::Qt::TreeItemController 
    def on_double_clicked
      fire :code_selected, data
    end
end