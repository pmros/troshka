class DetailPanelItemHashController < ::Shirka::Qt::TreeItemController
  def init(data)
    @item_ids = {}
    data[1].each {|key, value| add_item [key, value], item_class(value)}
  end
  
  def item_class(obj)
    name = obj.class.ancestors
      .map {|i| "DetailPanelItem#{i}Controller"}
      .find {|i| Object.const_get i rescue false}
    
    Object.const_get(name)
  end
end
