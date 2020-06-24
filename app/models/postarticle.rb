class Postarticle < ApplicationRecord

	belongs_to :user, optional: true
	has_many :postarticle_images, dependent: :destroy
	accepts_nested_attributes_for :postarticle_images
end
