class ArticlesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :users, foreign_key: true
  end
end
