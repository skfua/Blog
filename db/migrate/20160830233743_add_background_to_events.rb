class AddBackgroundToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :background, :string
  end
end
