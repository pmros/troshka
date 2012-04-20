module Troshka
  
  class Shell
    def initialize
      @binding = TOPLEVEL_BINDING
      $stdout = StringIO.new
    end
    
    def run(str)
      obj = eval(str, @binding, "(girb)")
      exception = nil
      
      $stdout.rewind
      output = $stdout.read
      $stdout.truncate(0)
      $stdout.rewind
    rescue Exception => e
      output = nil
      obj = nil
      exception = e
    ensure
      return {output: output, obj: obj, exception: exception}
    end
    
  end

end