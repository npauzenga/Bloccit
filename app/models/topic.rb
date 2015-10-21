class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : Topic.publicly_viewable }
  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }

  self.per_page = 50

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
end
