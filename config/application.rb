require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Attendance
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.i18n.default_locale = :vi
    config.active_job.queue_adapter = :sidekiq
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.assets.css_compressor = false
    config.action_mailer.delivery_method = :mailtrap
    config.action_mailer.mailtrap_settings = {
      api_key: ENV.fetch('MAILTRAP_API_KEY')
    }
    # config.time_zone = "Central Time (US & Canada)"
    config.autoload_paths << Rails.root.join("lib")
  end
end
