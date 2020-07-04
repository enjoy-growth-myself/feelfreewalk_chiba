class RenamePostimageIdColumnToPostarticleImages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :postarticle_images, :postimage_id, :image_id
  end
end
