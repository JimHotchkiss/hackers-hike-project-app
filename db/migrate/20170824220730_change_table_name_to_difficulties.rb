class ChangeTableNameToDifficulties < ActiveRecord::Migration[5.1]
  def change
    rename_table :categories, :difficulties
  end
end
