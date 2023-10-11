class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :commenter_id, null: false
      t.integer :artwork_id, null: false
      t.timestamps
    end

    add_foreign_key :comments, :artworks, column: :artwork_id
    add_foreign_key :comments, :users, column: :commenter_id
  end
end