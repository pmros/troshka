class OutputController < Shirka::Qt::TreeController
  def on_starting(e)
    watch app.components[:editor]
  end
  
  def on_code_evaluated(e)
    add_item e.msg
  end
  
  def on_code_selected(e)
    forward e
  end
end