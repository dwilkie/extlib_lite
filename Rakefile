require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the ExtlibLite plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'spec'
  t.libs << 'features'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "extlib_lite"
    gemspec.summary = "Lightweight alternative to activesupport and extlib"
    gemspec.email = "dwilkie@gmail.com"
    gemspec.homepage = "http://github.com/dwilkie/extlib_lite"
    gemspec.authors = ["David Wilkie"]
    gemspec.add_runtime_dependency "addressable", ">=2.1.1"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

desc 'Generate documentation for the ExtlibLite plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ExtlibLite'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

