class Postarticle < ApplicationRecord

	belongs_to :user, optional: true
	has_many :bookmark, dependent: :destroy
	has_many :postarticle_images, dependent: :destroy
	accepts_attachments_for :postarticle_images, attachment: :image
	validates :postarticle_images, length: {maximum: 3}
	validates :title, presence: true, length: { maximum: 16}
	has_many :postarticle_comments, dependent: :destroy
	geocoded_by :address
	# 住所だけ登録しても緯度、経度情報を保存(緯度経度情報でgooglemap上にマーカーを表示させているため)
	after_validation :geocode, if: :address_changed?

	def bookmark_by?(user)
    	bookmark.where(user_id: user.id).exists?
  	end
end
