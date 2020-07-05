class PostarticleImage < ApplicationRecord

	belongs_to :postarticle, optional: true
	attachment :image
	# 1つの記事に対して投稿できる画像の上限。今回は3枚とした。
	$image_par_article = 3

end
