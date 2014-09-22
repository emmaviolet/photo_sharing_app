class ChangeCoverPhotoToCoverPhotoId < ActiveRecord::Migration
  def up
    add_column :albums, :cover_photo_id, :integer
    remove_column :albums, :cover_photo
  end

  def down
    remove_column :albums, :cover_photo_id
    add_column :albums, :cover_photo, :string
  end
end
