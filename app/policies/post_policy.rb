class PostPolicy < ApplicationPolicy
  def edit?(a)
    if owner(a)
      true
    else
      false
    end
  end
end