class PostarticleImage < ApplicationRecord

	belongs_to :postarticle, optional: true
	attachment :image
end
