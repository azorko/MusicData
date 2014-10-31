class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id
      t.string :album_type
      t.string :name, null: false

      t.timestamps
    end
    add_index :albums, [:band_id, :name]
    
  end
end
