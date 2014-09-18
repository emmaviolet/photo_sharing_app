class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :album_id

      t.timestamps
    end
  end
end
