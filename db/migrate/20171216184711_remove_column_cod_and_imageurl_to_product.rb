class RemoveColumnCodAndImageurlToProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :cod_eligible
  end
end
