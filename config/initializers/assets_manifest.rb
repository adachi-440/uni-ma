Rails.application.config.assets_manifest =
  if File.exist?(Rails.root.join('public', 'js', 'dist', 'manifest.json'))
    JSON.parse(File.read(Rails.root.join('public', 'js', 'dist', 'manifest.json')))
  end
