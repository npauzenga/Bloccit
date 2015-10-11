class CommentPolicy < ApplicationPolicy
  def new?
  end

  def create?
    user.present?
  end
end
