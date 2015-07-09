class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.integer :language
      t.text :content

      t.timestamps null: false
    end
  end
end
