module StagingProtection
  module Base

    def self.extended(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
      base.send :init
    end

    module ClassMethods
      def init
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def protection_exclusion
            false
          end
        RUBY

        [:password, :message, :token, :environment].each do |method|
          class_eval <<-RUBY, __FILE__, __LINE__ + 1
            def self.#{method}= value
              @#{method} = value
            end

            def #{method}
              StagingProtection.#{method}
            end

            def self.#{method}
              @#{method}
            end
          RUBY
        end
      end

      def config &block
        @message = 'You are not authorized to access this page.'
        @environment = :staging
        yield self if block_given?
      end
    end

    module InstanceMethods
      def check_password_if_required
        if Rails.env == environment && (request.format && (!request.format.json? || !request.format.js?)) && params[:format] != 'json'
          if params[:pass] == password
            cookies['secret_token'] = token
          end
          unless protection_exclusion || cookies[:secret_token] == token
            render :text => message, :status => :not_found
          end
        end
      end

      def protection_exclusion
        false
      end
    end

  end
end
