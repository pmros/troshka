class OutputItemCodeView < Shirka::Qt::TreeItemView     
  def style(widget)
    widget.setForeground 0, Qt::Brush.new(Qt::Color.new 0, 0, 255)
  end
end