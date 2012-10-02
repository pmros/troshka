module Shirka

  class App
    include Eventalk
    
    attr_accessor :path
    
    def initialize
      setup
      init
    end
       
    def setup
    end
    
    def init     
    end
    
    def start
      load
      starting
      main_controller = MainController.new self
      main_controller.start
      started
    end
    
    def starting
    end
    
    def started
    end
    
    def load
      Dir[path + "/**/{view,controller}.rb"].each do |file|
        require_relative file
      end
    end
    
  end
  
end