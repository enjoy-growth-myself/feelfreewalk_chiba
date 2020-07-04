class Postarticle < ApplicationRecord

	belongs_to :user, optional: true
	has_many :bookmark, dependent: :destroy
	has_many :postarticle_images, dependent: :destroy
	accepts_nested_attributes_for :postarticle_images
	validates :title, presence: true, length: { maximum: 16 }
	
	geocoded_by :address
	# 住所だけ登録しても緯度、経度情報を保存(緯度経度情報でgooglemap上にマーカーを表示させている)
	after_validation :geocode, if: :address_changed?

	def bookmark_by?(user)
    	bookmark.where(user_id: user.id).exists?
  	end
end
