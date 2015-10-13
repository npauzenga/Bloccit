class CommentPolicy < ApplicationPolicy
  def show?
    create?
  end

  def create?
    user.present?

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end
