class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}
  
  attachment :profile_image
  has_many :postarticles
  has_many :bookmarks
  has_many :bookmark_postarticles, through: :bookmarks, source: :postarticle
  has_many :postarticle_comment


  def own_board?(postarticle)
 	self.id == postarticle.user_id
  end
end
