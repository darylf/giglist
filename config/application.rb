require File.expand_path('../boot', __FILE__)

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Giglist
  class Application < Rails::Application

    config.generators do |g|
      g.helper        false
      g.javascripts   false
      g.stylesheets   false
      g.test_framework :rspec, 
        helper_specs:   false,
        request_specs:  false, 
        routing_specs:  false, 
        view_specs:     false

    end

    config.active_record.raise_in_transactional_callbacks = true

  end
end
