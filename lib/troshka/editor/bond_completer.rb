require "bond"

# A Bond patch to work with Qt
class Bond::ObjectMission
  def default_action(obj)
    methods = klass(obj).instance_methods rescue obj.class.instance_methods
    methods.map {|e| e.to_s} - OPERATORS
  end  
end

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