class RemoveColumnFeatureImageUrl < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :feature_image_url
  end
end
