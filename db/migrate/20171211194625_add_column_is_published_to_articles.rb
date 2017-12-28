class AddColumnIsPublishedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :is_published, :boolean
  end
end
