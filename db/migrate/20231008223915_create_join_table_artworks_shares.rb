class CreateJoinTableArtworksShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, presence: true
      t.integer :viewer_id, presence: true
      t.index [:artwork_id, :viewer_id], unique: true

    end
    
    add_foreign_key :artwork_shares, :users, column: :viewer_id
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
  end
end
