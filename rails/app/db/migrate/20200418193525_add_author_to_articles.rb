class AddAuthorToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :author, :string
    add_column :stories, :created_at, :datetime
  end
end
