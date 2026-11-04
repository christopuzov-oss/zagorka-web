require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ZagorkaCompany
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.username = (YAML.load_file('/home/zagorkacompany/heinekenzagorkabrewery.bg/shared/config/admin.yml')['username'] rescue nil)
    config.password = (YAML.load_file('/home/zagorkacompany/heinekenzagorkabrewery.bg/shared/config/admin.yml')['password'] rescue nil)

    config.time_zone = 'Sofia'
    config.i18n.default_locale = :bg
    I18n.available_locales = [:bg, :en]
    config.i18n.fallbacks = [:en, :bg]

    config.site_name = 'zagorkacompany.bg'

    config.action_mailer.delivery_method = :smtp
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.facebook = 'https://www.facebook.com/search/top?q=%D0%B7%D0%B0%D0%B3%D0%BE%D1%80%D0%BA%D0%B0%2C%20%D1%87%D0%B0%D1%81%D1%82%20%D0%BE%D1%82%20%D1%85%D0%B0%D0%B9%D0%BD%D0%B5%D0%BA%D0%B5%D0%BD'
    config.youtube = 'https://www.youtube.com/channel/UCijubFII3HaIfeJ03kfXwUA'
    config.linkedin = 'https://www.linkedin.com/company/heineken/'
  end
end
