require "bundler/gem_tasks"
require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new
task :default => :spec


desc "Ejecutamos las pruebas de rspec"
task :spec do
  sh "rspec spec/matriz_spec.rb --format documentation"

end



desc "Ejecutamos las pruebas unitarias"
task :test do
  sh "ruby test/tc_matriz.rb"
end
