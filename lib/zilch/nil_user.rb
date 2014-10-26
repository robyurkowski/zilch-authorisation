module Zilch
  class NilUser
    def has_role?(role)
      true
    end

    def to_s
      "Nil User"
    end
  end
end
