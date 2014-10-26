require 'singleton'
require 'zilch/nil_user'

module Zilch
  class AuthorisationManager
    include Singleton

    # Does not throw an error if the user is authenticated.
    def authenticate!
      true
    end


    def authenticated?
      true
    end


    def has_role?(role)
      true
    end


    def current_user
      @current_user ||= user_factory.call
    end


    def allow_access_to_controller?(controller)
      true
    end


    private def user_factory
      Zilch::NilUser.method(:new)
    end
  end
end

