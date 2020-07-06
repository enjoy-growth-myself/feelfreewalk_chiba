class PostarticleComment < ApplicationRecord
	belongs_to :user
	belongs_to :postarticle
end
