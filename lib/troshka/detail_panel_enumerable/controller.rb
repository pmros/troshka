class DetailPanelEnumerableController < Shirka::Qt::TreeController
  def init(data)
    @item_ids = {}
    data.each_with_index {|obj, i| add_item [i, obj], item_class(obj)}
  end
  
  def item_class(obj)
    name = obj.class.ancestors
      .map {|i| "DetailPanelItem#{i}Controller"}
      .find {|i| Object.const_get i rescue false}
    
    Object.const_get(name)
  end
end