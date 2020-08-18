class PostPolicy < ApplicationPolicy
  def edit?(a)
    if owner(a)
      true
    else
      false
    end
  end
  def destroy?(a)
    if owner(a) || admin
      true
    else
      false
    end
  end
end