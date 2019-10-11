require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Discussions
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    
    config.load_defaults 5.1

    # 3534e10cbcd0858d0957436a52f20cb7d1708258e9d1dfd1077a54e8f919d9a5d72e044a13912abccbef41f1eeaa91cfa5b34a405033f33ea4919e90ed7c1df2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
