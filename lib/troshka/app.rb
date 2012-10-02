%w{ shirka qt }.each {|lib| require_relative "../shirka/#{lib}"}

module Troshka
  
  class App < ::Shirka::Qt::App
    def components
      @components ||= {}
    end
  
    def self.last_result
      @@last_result
    end
  
    def self.last_result=(result)
      @@last_result = result
    end  
  end

end