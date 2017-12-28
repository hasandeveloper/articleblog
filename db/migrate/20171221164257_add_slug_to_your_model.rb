class AddSlugToYourModel < ActiveRecord::Migration[5.1]
  change_table :articles do |t|
    t.string :slug, after: :id
  end
end
