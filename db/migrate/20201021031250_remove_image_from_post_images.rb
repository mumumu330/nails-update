class RemoveImageFromPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :image, :string
  end
end
