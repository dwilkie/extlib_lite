require 'addressable/uri'
# Load each available extension
Dir["#{File.dirname(__FILE__)}/core_extensions/*.rb"].sort.each do |path|
  require "extlib_lite/core_extensions/#{File.basename(path)}"
end

