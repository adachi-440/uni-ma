if File.exist?(Rails.root.join('public', 'js', 'dist', 'manifest.json'))
  Rails.application.config.assets_manifest =
    JSON.parse(File.read(Rails.root.join('public', 'js', 'dist', 'manifest.json')))
end
