module Troshka
  
  class Shell
    attr_accessor :result
    
    def initialize
      @binding = TOPLEVEL_BINDING
      $stdout = StringIO.new
    end
    
    def run(str)
      @result = eval(str, @binding, "(troshka)")
      eval("_ = Troshka.app.shell.result", @binding)
      
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
      return {output: output, obj: @result, exception: exception}
    end
    
  end

end