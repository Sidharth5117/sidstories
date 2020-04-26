class CreateStorieCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :storie_categories do |t|
    t.integer :storie_id
    t.integer :category_id
    end
  end
end
