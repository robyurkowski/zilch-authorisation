module Zilch
  module Authorisation
    class UsersManager
      def primary_user
        raise NotImplementedError, "primary_user was not specified!"
      end
    end
  end
end
