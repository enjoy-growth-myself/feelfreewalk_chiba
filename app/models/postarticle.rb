class Postarticle < ApplicationRecord

	belongs_to :user, optional: true
	has_many :postarticles_image
end
