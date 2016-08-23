class AddFabulaToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :fabula, :text
  end
end
