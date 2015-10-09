class Topic < ActiveRecord::Base
  has_many :posts

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
end
