class MethodsController < Shirka::Qt::TreeController
  def on_starting(e)
    watch app.components[:editor]
  end
  
  def on_code_evaluated(e)
    view.clear
    obj = e.msg[:obj]
    #obj.methods.sort.each {|m| puts m.to_s}
    #obj.methods.sort.each {|m| add_item m.to_s}
    add_item ["class", obj.class.to_s]
    add_item ["object_id", obj.object_id.to_s]
    add_item ["methods", obj.methods.size.to_s]
    add_item ["count", obj.count.to_s] rescue nil
  end
end