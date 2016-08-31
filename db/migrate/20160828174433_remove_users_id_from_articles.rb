class RemoveUsersIdFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :users_id
  end
end
