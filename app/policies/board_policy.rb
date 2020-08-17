class BoardPolicy < ApplicationPolicy
  def index?
    true
  end
  
  def show?
    true
  end

  def create? #new可以不寫，因為沿用application_policy
    #plan_a_user || plan_b_user || admin #角色若是共用，可以放到上層
    if plan_a_user
      user.boards.count < 2
    elsif plan_b_user || admin
      true
    else
      false
    end
  end
end