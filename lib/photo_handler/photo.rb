require "exifr"

module PhotoHandler
  class Photo
    def initialize(filename)
      @filename = filename
      self
    end

    def exif
      unless @exif
        begin
          @exif = EXIFR::JPEG.new(@filename)
        rescue EXIFR::MalformedJPEG
          @exif = EXIFR::TIFF.new(@filename)
        end
      end
      @exif
    end

    def destination_file_name
      elements = Config.destination_file_name.split("/")
      elements.map! do |element|
        case element
        when ":ext"
          File.extname(@filename).downcase[1..-1]
        when ":date"
          exif.date_time.strftime("%Y-%m-%d")
        when ":original_name"
          File.basename(@filename)
        else
          element
        end
      end
      File.join(elements)
    end
  end
end
