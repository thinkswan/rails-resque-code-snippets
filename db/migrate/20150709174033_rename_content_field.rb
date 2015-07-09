class RenameContentField < ActiveRecord::Migration
  def change
    rename_column :snippets, :content, :plain_code
  end
end
