class DetailPanelObjectView < Shirka::View
  def widget_class
    ::Qt::TextEdit
  end
  
  def build(widget)
    widget.text = data
  end
end