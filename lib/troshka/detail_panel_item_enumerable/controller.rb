class DetailPanelItemEnumerableController < ::Shirka::Qt::TreeItemController
  def init(data)
    @item_ids = {}
    data[1].each {|k, v| add_item [k, v], item_class(obj)}
  end
  
  def item_class(obj)
    name = obj.class.ancestors
      .map {|i| "DetailPanelItem#{i}Controller"}
      .find {|i| Object.const_get i rescue false}
    
    Object.const_get(name)
  end
end
