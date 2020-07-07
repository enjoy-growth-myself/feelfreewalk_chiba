class PostarticleComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :postarticle, optional: true
	validates :comment, presence: true, length: { maximum: 16 }
end
