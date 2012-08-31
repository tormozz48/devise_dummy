require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Communal2
  class Application < Rails::Application

    # config.autoload_paths += %W(#{config.root}/extras)
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    config.time_zone = 'Central Time (US & Canada)'

    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    # config.active_record.schema_format = :sql

    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    config.assets.version = '1.0'
  end
end
