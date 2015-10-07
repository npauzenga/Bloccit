class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order(created_at: :desc) }
  scope :ordered_by_title, -> { reorder(title: :asc) }
  scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc) }
end
