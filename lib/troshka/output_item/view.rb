class OutputItemView < Shirka::Qt::TreeItemView
  def init(data)
    @data = "Time elapsed: %.3f ms" % data
  end

  def style(widget)
    widget.setForeground 0, Qt::Brush.new(Qt::Color.new 100, 100, 100)
  end
end