class Comment < ApplicationRecord
  validates :body, presence: true  
  belongs_to :commenter, foreign_key: :commenter_id, class_name: 'User', dependent: :destroy
  belongs_to :artwork, dependent: :destroy  
end