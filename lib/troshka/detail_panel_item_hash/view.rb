class DetailPanelItemHashView < ::Shirka::Qt::TreeItemView     
  def build(widget)
    index, value = data
    widget.setText 0, index.to_s
    
    widget.setText 1, "#{value.class} #{value.count} items"
    widget.setForeground 0, Qt::Brush.new(Qt::Color.new 128, 128, 128)
    widget.setForeground 1, Qt::Brush.new(Qt::Color.new 128, 128, 128)
  end       
end
