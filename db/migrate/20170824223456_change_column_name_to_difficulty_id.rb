class ChangeColumnNameToDifficultyId < ActiveRecord::Migration[5.1]
  def change
    rename_column :hikes, :rank_id, :difficulty_id
  end
end
