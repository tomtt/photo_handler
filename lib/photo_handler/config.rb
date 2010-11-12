module PhotoHandler
  class Config
    class << self
      @@config = nil

      protected
      def config
        @@config ||= YAML.load_file(PhotoHandler.root.join(*%w(config photo_handler.yml)))[PhotoHandler.env]
      end

      public

      def has_setting?(name)
        self.config.has_key?(name.to_s)
      end

      def method_missing(name, *args)
        if has_setting?(name.to_s)
          self.config[name.to_s]
        else
          super
        end
      end
    end
  end
end
