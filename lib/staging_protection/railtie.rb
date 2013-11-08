require 'staging_protection'

module StagingProtection
  require 'rails'

  class Railtie < Rails::Railtie
    rake_tasks { load "tasks/init.rake" }
  end
end
