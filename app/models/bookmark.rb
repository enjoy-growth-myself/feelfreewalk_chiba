class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :postarticle
  validates :user_id, uniqueness: { scope: :postarticle_id }
end
