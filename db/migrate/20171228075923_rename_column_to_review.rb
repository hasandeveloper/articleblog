class RenameColumnToReview < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :product_id, :article_id
  end
end
