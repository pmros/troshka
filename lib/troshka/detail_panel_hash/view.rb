class DetailPanelHashView < Shirka::Qt::TreeView
  def style(widget)
    widget.setHeaderLabels ["Index", "Value"] 
  end
end