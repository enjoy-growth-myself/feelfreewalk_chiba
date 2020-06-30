class PostarticleImage < ApplicationRecord

	belongs_to :postarticle, optional: true
	has_many :bookmark, dependent: :destroy
	attachment :image
	
	# 1つの記事に対して投稿できる画像の上限。今回は6枚とした。
	$image_par_article = 6

	# def max_image(article_id)
	#  	image = PostarticleImage.where(postarticle_id: article_id)
	#  	if image.count > $image_par_article
	#  		errors.add(:postarticle_id, "写真は1つの記事に対して5枚までしか投稿できません")
	#  	end
	#  end
end
