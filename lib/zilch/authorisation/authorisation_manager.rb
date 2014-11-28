require 'zilch/authorisation/nil_user'

module Zilch
  module Authorisation
    class AuthorisationManager

      ##
      # Authenticate against the session, setting current_user if not
      # already set. Returns true or false if not authenticated.
      def authenticate
        !!(@current_user ||= user_factory.call)
      end

      ##
      # Exception-raising version of `#authenticate`. Raise if not
      # authenticated.
      def authenticate!
        throw Zilch::Authorisation::NotAuthorisedException unless authenticate
      end


      def authenticated?
        @current_user
      end


      def current_user
        @current_user ||= user_factory.call
      end


      def allow?(action, object_or_class = nil)
        true
      end


      private def user_factory
        Zilch::Authorisation::NilUser.method(:new)
      end
    end
  end
end
