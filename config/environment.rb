# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

APP_SECRETS = (YAML.load_file(Rails.root.join('config', 'app_secrets.yml')) rescue {})

ActionMailer::Base.smtp_settings = {
  address: 'lava.superhosting.bg',
  port: 465,
  domain: 'superhosting.bg',
  authentication: 'login',
  user_name: APP_SECRETS.dig('smtp', 'user_name'),
  password: APP_SECRETS.dig('smtp', 'password'),
  ssl: true,
  openssl_verify_mode: 'none'
}

ActionMailer::Base.default from: 'noreply@zagorkacompany.bg'
