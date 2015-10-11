class CommentPolicy < ApplicationPolicy
  def show?
    create?
  end

  def create?
    user.present?
  end
end
