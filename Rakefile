require 'rubygems'
require 'rake'
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name= "when_easter"
    gemspec.summary = "Get the date of Roman and Greek Easter"
    gemspec.description = "A tool that calculates the dates of Roman and Greek Easter."
    gemspec.email = "michal@nierebinski.pl"
    gemspec.homepage = "https://github.com/Loyolny/when_easter"
    gemspec.executables = ["when_easter","when_roman_easter","when_greek_easter"]
    gemspec.authors = ["Michał Nierebiński"]
    gemspec.date = File.utime(0,0,'VERSION')
    
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Ya don't have Jeweler gem installed. Install it with: sudo gem install jeweler"
end
#Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }