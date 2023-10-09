class AddForeignKeyArtistIdToArtworks < ActiveRecord::Migration[7.0]
  def change
    add_reference :artworks, :user, column: :artist_id, foreign_key: true
  end
end
