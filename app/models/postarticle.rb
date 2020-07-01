class Postarticle < ApplicationRecord

	belongs_to :user, optional: true
	has_many :bookmark, dependent: :destroy
	has_many :postarticle_images, dependent: :destroy
	accepts_nested_attributes_for :postarticle_images
	validates :title, presence: true

	def bookmark_by?(user)
    	bookmark.where(user_id: user.id).exists?
  	end
end
