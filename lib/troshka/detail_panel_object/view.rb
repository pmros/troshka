class DetailPanelObjectView < Shirka::View
  def widget_class
    ::Qt::TextEdit
  end
  
  def build(widget)
    widget.plain_text = data
  end
end