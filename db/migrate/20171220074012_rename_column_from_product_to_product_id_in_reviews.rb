class RenameColumnFromProductToProductIdInReviews < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :product, :product_id
  end
end
