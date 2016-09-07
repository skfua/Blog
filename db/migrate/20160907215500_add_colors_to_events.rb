class AddColorsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :bg_color, :text
    add_column :events, :secondary_color, :text
    add_column :events, :text_color, :text
    add_column :events, :secondary_text, :text
  end
end
