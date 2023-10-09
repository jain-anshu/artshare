class RemoveReferencefromArtworks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :artworks, :user
  end
end
