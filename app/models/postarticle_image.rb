class PostarticleImage < ApplicationRecord

	belongs_to :postarticle, optional: true
	attachment :image
	# 1つの記事に対して投稿できる画像の上限。今回は3枚とした。
	$image_par_article = 3


	 def max_image(article_id)
	 	image = PostarticleImage.where(postarticle_id: article_id)
	 	if image.count > $image_par_article
	 		errors.add(:postarticle_id, "写真は1つの記事に対して3枚までしか投稿できません")
	 	end
	 end
end
