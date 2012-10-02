class DetailPanelHashController < Shirka::Qt::TreeController
  def init(data)
    @item_ids = {}
    data.each {|k, v| add_item [k, v], item_class(v)}
  end
  
  def item_class(obj)
    name = obj.class.ancestors
      .map {|i| "DetailPanelItem#{i}Controller"}
      .find {|i| Object.const_get i rescue false}
    
    Object.const_get(name)
  end
end