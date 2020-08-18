class PostPolicy < ApplicationPolicy
  def update?(post)
    if owner_of?(post)
      true
    else
      false
    end
  end

  def edit?(post)
    update?(post)
  end
  
  def destroy?(post)
    if owner_of?(post) || admin
      true
    else
      false
    end
  end
end