class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.text :lyrics
      t.string :track_type
      t.string :name

      t.timestamps
    end
    add_index :tracks, [:name, :album_id]
    
  end
end
