require 'jekyll-assets'
#module Jekyll
  #module AssetsPlugin
    #class Renderer
      #def render_asset_path type = nil
        #asset ||= @site.assets[@path]

        #unless @site.static_files.include? asset
          #@site.static_files << AssetFile.new(@site, asset)
        #end

        #extension = File.extname(asset.digest_path)

        #prefix = ''
        #@site.assets_config.target_dir.each do |k, v|
          #if extension =~ k
            #prefix = v
          #end
        #end

        #path = []
        #[ @site.assets_config.baseurl, prefix ].each do |segment|
          #path << segment unless segment.nil? || segment == ''
        #end
        #path << asset.digest_path

        #return path.join '/'
      #end

      #def render_javascript
        #@path << '.js' if File.extname(@path).empty?

        #JAVASCRIPT % render_asset_path(:js)
      #end

      #def render_stylesheet
        #@path << '.css' if File.extname(@path).empty?

        #STYLESHEET % render_asset_path(:css)
      #end
    #end

    #class AssetFile
      #def destination dest
        #extension = File.extname(@asset.digest_path)

        #prefix = ''
        #@site.assets_config.target_dir.each do |k, v|
          #if extension =~ k
            #prefix = v
          #end
        #end

        #path = []
        #[ @site.assets_config.baseurl, prefix ].each do |segment|
          #path << segment unless segment.nil? || segment == ''
        #end

        #File.join(dest, path, @asset.digest_path)
      #end
    #end
  #end
#end
