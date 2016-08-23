class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
