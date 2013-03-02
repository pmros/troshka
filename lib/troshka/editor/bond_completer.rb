gem 'bond', '<= 0.4.2'
require "bond"

class Completer
  def initialize
    Bond.start
    @completer = Bond.agent
  end
  
  def complete(word, line)
    list = @completer.call word, line
    list.sort!
  end
   
end