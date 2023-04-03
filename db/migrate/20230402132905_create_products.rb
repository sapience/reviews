class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :tumbnail_image_path
      t.float :overall_rating

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
