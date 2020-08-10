class CreatePostarticles < ActiveRecord::Migration[5.2]
  def change
    create_table :postarticles do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
