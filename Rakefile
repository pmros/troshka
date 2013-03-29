require 'rubygems/package_task'

task :default => :gem
 
desc 'Builds the troshka gem'
task :gem  do
  spec = Gem::Specification.load 'troshka.gemspec'
  Gem::Package.build(spec) 
end