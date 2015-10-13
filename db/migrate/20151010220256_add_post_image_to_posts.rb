class AddPostImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_image, :string
  end
end
