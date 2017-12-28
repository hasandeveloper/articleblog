class AddColumnCodAndImageurlToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :cod_eligible, :boolean
  end
end
