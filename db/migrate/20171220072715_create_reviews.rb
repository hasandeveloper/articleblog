class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :product
      t.integer :user_id
      t.float :rating

      t.timestamps
    end
  end
end
