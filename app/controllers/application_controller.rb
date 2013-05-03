class ApplicationController < ActionController::Base
  protect_from_forgery
  # config.assets.enabled = true
  # config.assets.version = '1.0'
  if defined?(Bundler)  
  	Bundler.require *Rails.groups(:assets => %w(development test))
  end
end
