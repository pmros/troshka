class OutputView < Shirka::Qt::TreeView  
  def on_view_adding(view, slot=nil)
    super
    view.widget.setExpanded true
    widget.scrollToBottom
  end 

  def label
    "Output"
  end
end