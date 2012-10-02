module Shirka
  
  class Components
    def initialize
      @slot_components = Hash.new {|h,k| h[k] = []}
      @component_slot = {}
    end
    
    def add(slot, component)
      @slot_components[slot] << component
      @component_slot[component] = slot
    end
    
    def slots
      @slot_components[slot].keys
    end
    
    def components
      @component_slot[component].keys
    end
    
    def components_by_slot(slot)
      @slot_components[slot]
    end
    
    def slot_by_component(component)
      @component_slot[component]
    end
  end

end