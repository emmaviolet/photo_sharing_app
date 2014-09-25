class RemoveImageFromPhoto < ActiveRecord::Migration
  def up
    remove_column :photos, :image
  end

  def down
    add_column :photos, :image, :string
  end
end
