class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name, null: false
      t.text :written_review
      t.integer :rating, null: false
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
