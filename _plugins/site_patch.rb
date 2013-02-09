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
          if base.to_s =~ Regexp.compile(exp)
            asset = assets.find_asset(f.to_s)
            asset.write_to(File.join(dest, asset.logical_path))
          end
        end
      end
    end
  end
end
