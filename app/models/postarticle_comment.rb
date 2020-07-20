class PostarticleComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :postarticle, optional: true
	validates :comment, presence: true, length: { maximum: 16 }

	 def total_score(postarticle_id)
	 	comments = PostarticleComment.where(postarticle_id: postarticle_id)
	 	total_score = 0
		comments.each do |comment|
			if comment.score.present?
			total_score = total_score + comment.score
			end
		end
		return total_score
	 end
end
