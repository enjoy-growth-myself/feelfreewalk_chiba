class PostarticleImage < ApplicationRecord

	belongs_to :postarticle, optional: true
	attachment :image
	# 1つの記事に対して投稿できる画像の上限。今回は6枚とした。
	$image_par_article = 6

	
end
