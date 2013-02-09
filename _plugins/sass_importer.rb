require 'sprockets/sass_importer'

module Sprockets
  class SassImporter < Sass::Importers::Filesystem
    def extensions
      {
        "css" => :scss,
        "css.sass" => :sass,
        "css.scss" => :scss
      }.merge!(super)
    end
  end
end
