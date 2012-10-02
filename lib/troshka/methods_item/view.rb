class MethodsItemView < ::Shirka::Qt::TreeItemView     
  def build(widget)
    data.each_with_index {|item, i| widget.setText i, item}
  end       
end
