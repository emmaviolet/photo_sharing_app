class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.string :name
      t.string :cover_photo
      t.string :description

      t.timestamps
    end
  end
end
