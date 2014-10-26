require 'singleton'

module Zilch
  class UsersManager
    include Singleton


    def primary_user
      raise NotImplementedError, "primary_user was not specified!"
    end
  end
end
