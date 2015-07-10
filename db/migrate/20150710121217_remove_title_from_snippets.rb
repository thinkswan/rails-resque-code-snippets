class RemoveTitleFromSnippets < ActiveRecord::Migration
  def change
    remove_column :snippets, :title
  end
end
