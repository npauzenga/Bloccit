class Summary < ActiveRecord::Base
  belongs_to :post

  # TODO
  #validates :post, presence: true
end
