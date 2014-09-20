class AddPhotoFileToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_file, :string
  end
end
