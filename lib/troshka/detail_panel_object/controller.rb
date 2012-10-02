class DetailPanelObjectController < Shirka::Controller 
    def view
      @view ||= view_class.new self, data.to_s
    end
end