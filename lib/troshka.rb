%w{Qt4 qscintilla bond stringio}.each {|lib| require "#{lib}"}

%w{app detail detail_anything detail_array_hash editor output shell}.each do |lib|
  require_relative "./troshka/#{lib}"
end
