module Zilch
  module Authorisation
    class NilUser
      def to_s
        self.class.to_s
      end
    end
  end
end
