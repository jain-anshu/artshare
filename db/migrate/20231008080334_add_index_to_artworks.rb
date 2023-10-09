class AddIndexToArtworks < ActiveRecord::Migration[7.0]
  def change
    add_index :artworks, [:artist_id, :title], unique: true, name: 'artist_id_title_index'
  end
end
