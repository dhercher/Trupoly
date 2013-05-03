class ApplicationController < ActionController::Base
  protect_from_forgery
  config.assets.enabled = true
  config.assets.version = '1.0'
  Bundler.require(:default, Rails.env) if defined?(Bundler)
end
