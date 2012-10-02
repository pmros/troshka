class DetailController < Shirka::Qt::MultipanelController
  def init(data)
    add_item "", DetailPanelObjectController
  end
  
  def on_starting(e)
    watch app.components[:editor]
  end
  
  def on_code_evaluated(e)
    obj = e.msg[:obj]
    
    #controller_class = if obj.respond_to? :each
    #  DetailPanelEnumerableController
    #else
    #  DetailPanelController
    #end
    
    name = obj.class.ancestors
      .map{|i| "DetailPanel#{i}Controller"}
      .find {|i| Object.const_get i rescue false}

    add_item obj, Object.const_get(name) unless name.nil?
  end
end