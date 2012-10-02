class DetailPanelItemObjectView < ::Shirka::Qt::TreeItemView     
  def build(widget)
    data.each_with_index {|item, i| widget.setText i, item.to_s}
    widget.setForeground 0, Qt::Brush.new(Qt::Color.new 128, 128, 128)
  end       
end
