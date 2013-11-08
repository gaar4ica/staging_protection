require "staging_protection/railtie" if defined?(Rails)
require "staging_protection/version"
require "staging_protection/base"

module StagingProtection

  extend ActiveSupport::Concern

  included do
    before_filter :check_password_if_required
  end

  private

  extend Base

end

ActionController::Base.class_eval <<-RUBY, __FILE__, __LINE__ + 1
  include StagingProtection
RUBY
