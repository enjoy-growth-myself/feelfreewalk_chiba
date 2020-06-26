class PostarticleImage < ApplicationRecord

	belongs_to :postarticle, optional: true
	attachment :image
	validate :max_image

	# 1つの記事に対して投稿できる画像の上限。今回は5枚とした。
	$image_par_article = 5

	def max_image
		image_id = PostarticleImage.find_by(postarticle_id)
		if image_id > $image_par_article
			errors.add(:postarticle_id, "写真は1つの記事に対して5枚までしか投稿できません")
	end
end
