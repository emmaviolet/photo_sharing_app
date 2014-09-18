class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :photo_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
