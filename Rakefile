require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc "Set up a skeleton environment"
task :environment do
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'lib'))
  Dir[File.join(File.dirname(__FILE__), "lib" , "**/*.rb")].each do |f|
    require f
  end
end

task :default => [:environment, :spec] do
  
end

