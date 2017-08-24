class ChangeColumnNameToRank < ActiveRecord::Migration[5.1]
  def change
    rename_column :difficulties, :name, :rank
  end
end
