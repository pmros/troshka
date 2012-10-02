module Shirka
  module Qt
    
    class App < ::Shirka::App
      def setup
        @qt_app = ::Qt::Application.new []
      end
      
      def started
        fire :starting
        fire :started
        @qt_app.exec
      end
      
      def icon=(path)
        @qt_app.setWindowIcon ::Qt::Icon.new(path)
      end
    end
    
  end
end