require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

OAUTH_KEYS = YAML.load(File.read(File.expand_path('../oauth_keys.yml', __FILE__)))

module BookAndRead
  class Application < Rails::Application
    config.sass.preferred_syntax = :sass
    config.active_record.raise_in_transactional_callbacks = true
  end
end
