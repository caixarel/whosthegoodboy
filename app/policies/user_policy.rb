class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
   def profile?
      true
  end
  def offers_made?
    true
  end
end
