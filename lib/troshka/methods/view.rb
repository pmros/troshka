class MethodsView < Shirka::Qt::TreeView
  def label
    "Methods"
  end
  
  def clear
    widget.clear
  end
  
  def style(widget)
    widget.setHeaderLabels ["Property", "Value"] 
  end
end