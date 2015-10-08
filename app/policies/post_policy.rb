class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      fail Pundit::NotAuthorizedError unless user.present?
      user.admin? || user.moderator? ? scope.all : scope.where(user: user)
    end
  end

  def index?
    true
  end
end
