secrets = (YAML.load_file(Rails.root.join('config', 'app_secrets.yml')) rescue {})

Recaptcha.configure do |config|
  config.site_key = secrets.dig('recaptcha', 'site_key')
  config.secret_key = secrets.dig('recaptcha', 'secret_key')
end
