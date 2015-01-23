require 'forwardable'

module Zilch
  module Authorisation
    # Interface for interacting with users.
    #
    # @since x.x.x
    class UsersManager
      extend Forwardable


      def_delegators :adapter, :primary_user


      # Reader for the adapter which implements this interface.
      #
      # @since x.x.x
      def adapter
        @adapter ||= default_adapter
      end


      # Setter for the adapter which implements the interface.
      #
      # @since x.x.x
      attr_writer :adapter


      # Specifies the default adapter to use.
      #
      # @since x.x.x
      def default_adapter
        Zilch::Authorisation::Adapters::Default.new
      end
    end
  end
end
