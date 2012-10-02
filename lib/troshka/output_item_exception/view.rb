class OutputItemExceptionView < Shirka::Qt::TreeItemView
  def style(widget)
    widget.setBackground 0, Qt::Brush.new(Qt::Color.new 255, 0, 0)
    widget.setForeground 0, Qt::Brush.new(Qt::Color.new 255, 255, 255)
  end
end