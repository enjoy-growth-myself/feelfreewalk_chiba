class PostarticleComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :postarticle, optional: true
end
