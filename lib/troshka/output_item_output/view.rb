class OutputItemOutputView < Shirka::Qt::TreeItemView
  def style(widget)
    widget.setBackground 0, Qt::Brush.new(Qt::Color.new 244, 255, 155)
  end
end