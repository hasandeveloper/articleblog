class AddColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :user_id, :integer
    add_column :articles, :article_id, :integer
  end
end