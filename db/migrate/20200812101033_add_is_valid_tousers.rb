class AddIsValidTousers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :is_valid, :boolean, null: false, default: true
  end
end
