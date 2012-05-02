module Troshka
  def self.start
    app.start
  end
  
  def self.app
    @app ||= App.new
  end
end


%w{Qt4 bond stringio}.each {|lib| require "#{lib}"}

begin
  require "qscintilla"
  require_relative "./troshka/editor"
rescue LoadError
  # If you don't have QScintilla, Troshka uses a QTextEdit based widget  
  require_relative "./troshka/qt_editor"
end

%w{app detail detail_anything detail_array_hash output shell}.each do |lib|
  require_relative "./troshka/#{lib}"
end


