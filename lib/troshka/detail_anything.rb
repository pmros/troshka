module Troshka
  
  class DetailAnything < Qt::TextEdit
    def view(obj)
      self.text = obj.to_s
    end
  end
  
end