# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( for_git/bootstrap.min.css ) 
Rails.application.config.assets.precompile += %w( for_git/AdminLTE.min.css )
Rails.application.config.assets.precompile += %w( for_git/_all-skins.min.css )

Rails.application.config.assets.precompile += %w(demo.js)
Rails.application.config.assets.precompile += %w(search.js )
Rails.application.config.assets.precompile += %w(fastclick.min.js)
Rails.application.config.assets.precompile += %w(Chart.min.js)
Rails.application.config.assets.precompile += %w(jQuery-2.1.4.min.js)
Rails.application.config.assets.precompile += %w(bootstrap.min.js)
Rails.application.config.assets.precompile += %w(app.min.js )
