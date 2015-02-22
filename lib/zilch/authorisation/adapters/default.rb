require 'zilch/authorisation/nil_user'

module Zilch
  module Authorisation
    module Adapters
      class Default

        def allow?(operation, resource)
          true
        end

        def authenticate!
          true
        end

        def current_user
          Zilch::Authorisation::NilUser.new
        end

      end
    end
  end
end
