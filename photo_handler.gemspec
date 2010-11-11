lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'photo_handler/version'

Gem::Specification.new do |s|
  s.name        = "photo_handler"
  s.version     = PhotoHandler::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tom ten Thij"]
  s.email       = ["ruby@tomtenthij.nl"]
  s.homepage    = "http://github.com/tomtt/photo_handler"
  s.summary     = "Utilities for managing digital images"
  s.description = "Utilities for managing digital images"

  s.files        = Dir.glob("{bin,lib}/**/*")
  s.executables  = ['phimport']
  s.require_path = 'lib'
  s.add_runtime_dependency 'exifr'
end
