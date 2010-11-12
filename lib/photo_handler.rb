require "bundler/setup"
require "photo_handler/config"
if Gem.available?("ruby-debug")
  require "ruby-debug"
end

module PhotoHandler
  def self.root
    Pathname.new(__FILE__).dirname.parent
  end

  def self.env
    "default"
  end
end
