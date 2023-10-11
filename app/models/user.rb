class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :artworks, foreign_key: :artist_id, class_name: 'Artwork'
  has_many :shared_artworks, foreign_key: :viewer_id, class_name: 'ArtworkShare'
  has_many :viewed_artworks, through: :shared_artworks, source: :artwork
  has_many :comments, foreign_key: :commenter_id, class_name: 'Comment'
end