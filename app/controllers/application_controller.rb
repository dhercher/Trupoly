class ApplicationController < ActionController::Base
  protect_from_forgery
  config.assets.enabled = true
  config.assets.version = '1.0'
  if defined?(Bundler)

    # If you precompile assets before deploying to production, use this line
    Bundler.require *Rails.groups(:assets => %w(development test))
    # If you want your assets lazily compiled in production, use this line
    # Bundler.require(:default, :assets, Rails.env)
  end
end
