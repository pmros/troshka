class DetailPanelItemEnumerableController < ::Shirka::Qt::TreeItemController
  def init(data)
    @item_ids = {}
    data[1].each_with_index {|i, index| add_item [index, i], item_class(i)}
  end
  
  def item_class(obj)
    name = obj.class.ancestors
      .map {|i| "DetailPanelItem#{i}Controller"}
      .find {|i| Object.const_get i rescue false}
    
    Object.const_get(name)
  end
end
