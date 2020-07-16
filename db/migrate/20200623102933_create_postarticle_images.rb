class CreatePostarticleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :postarticle_images do |t|
    	t.integer :postarticle_id, null: false
    	t.string :postimage_id


      t.timestamps
    end
  end
end
