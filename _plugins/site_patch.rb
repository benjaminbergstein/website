module Jekyll
  class Site
    alias_method :old_process, :process

    def process
      custom_plugins
      old_process
    end

    private

    def custom_plugins
      site, config, assets = self, self.config, self.assets
      dest = File.join(config['source'], 'assets')
      assets.each_file do |f|
        base, ext = f.basename, f.extname
        self.config['assets']['precompile'].each do |exp|
          if Numeric === (Regexp.compile(exp) =~ base.to_s)
            asset = assets.find_asset(f.to_s)
            pathname = asset.pathname.to_s
            write_path = config['assets']['sources'].inject(false) do |memo, path|
              index = pathname.index(path)
              index ?  pathname[index + path.length..-1] : memo
            end
            asset.write_to(File.join(dest, write_path))
          end
        end
      end
    end
  end
end
