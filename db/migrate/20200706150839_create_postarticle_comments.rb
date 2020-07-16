class CreatePostarticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :postarticle_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :postarticle_id
      t.timestamps
    end
  end
end
