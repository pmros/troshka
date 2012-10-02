class MainController < Shirka::Controller
  def start
    view.show
  end

  def init(data)
    app.components[:output] = OutputController.new(app, self, [])
    add_component app.components[:output], :main
    
    add_component DetailController.new(app, self, []), :info
    add_component MethodsController.new(app, self, []), :info2
    
    app.components[:editor] = EditorController.new(app, self, [])
    add_component app.components[:editor], :editor
  end  
end