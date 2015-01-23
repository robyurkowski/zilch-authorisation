require 'forwardable'
# require 'zilch-authorisation/adaptors/default'

module Zilch
  module Authorisation
    # Zero-dependency authorisation stub for Rails engines. Provides the
    # capability to refer to a generic adapter with consistent interface and
    # to specify an adapter (provided by a separate package) to define
    # implementation details for any potential provider.
    #
    # @since x.x.x
    class AuthorisationManager
      extend Forwardable

      def_delegators :adapter, :authenticate, :authenticated?, :current_user, :allow?

      # Exception-raising version of `#authenticate`. Raise if not
      # authenticated.
      #
      # @since x.x.x
      def authenticate!
        raise Zilch::Authorisation::NotAuthorisedException unless @adapter.authenticate!
        @adapter.current_user
      end


      # Reader for the adapter which implements this interface.
      #
      # @since x.x.x

      def adapter
        @adapter ||= default_adapter
      end


      # Setter for the adapter which implements the interface. The given
      # adapter must respond to 
      #
      # @since x.x.x
      attr_writer :adapter

      # Defines the proc that is `called` in order to retrieve an adapter
      # that should be used to fulfill the interface.
      #
      # @since x.x.x
      def default_adapter
        Zilch::Authorisation::Adapters::Default.new
      end


    end

    class NotAuthorisedException < Exception
    end
  end
end
