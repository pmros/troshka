require 'rake'

Gem::Specification.new do |s|
  s.name = 'troshka'
  s.author = 'Patricio Ros'
  s.email = 'patricioros.dev@gmail.com'
  s.summary = 'A GUI Ruby console' 
  s.description = <<-DESC
  Troshka is an GUI Ruby console. It's an alternative to irb and
  other Ruby REPLs. 
  Troshka is written in Ruby and GUI uses Qt bindings.
  DESC
  s.version = '0.0.2'
  s.required_ruby_version = '>=1.9.0'
  s.requirements << 'QtRuby'
  s.add_dependency 'bond'
  s.bindir = 'bin'
  s.executables = 'troshka'
  s.files = FileList['lib/**/*.*']
  s.homepage = 'https://github.com/pmros/troshka'
end
