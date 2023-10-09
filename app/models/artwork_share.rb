class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true
  belongs_to :artwork
  belongs_to :viewer, foreign_key: :viewer_id, class_name: 'User'
  
end