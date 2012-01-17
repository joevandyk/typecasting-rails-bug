require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups(:assets => %w(development test)))

module Typecasting
  class Application < Rails::Application
    config.active_record.schema_format = :sql
  end
end
