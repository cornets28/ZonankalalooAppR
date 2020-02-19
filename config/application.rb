# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Discussions
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.load_defaults 5.1
    config.secret_key_base = '57f3410eabcefd5fd220b1e1c7a5f8638fd0e175b0bbca8cc8d4bc99fe766a421fa79b3d25cd1216a260c187072b4604dd601db40430a91540b016c999a16625'

    # 3534e10cbcd0858d0957436a52f20cb7d1708258e9d1dfd1077a54e8f919d9a5d72e044a13912abccbef41f1eeaa91cfa5b34a405033f33ea4919e90ed7c1df2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
