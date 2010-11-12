require "bundler/setup"
require "photo_handler/env"
require "photo_handler/config"
require "photo_handler/photo"
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

  def self.source_images
    source_images = []
    Find.find(Config.image_source_directory) do |path|
      if Config.image_extensions.include?(File.extname(path))
        source_images << path
      end
    end
    source_images
  end
end
