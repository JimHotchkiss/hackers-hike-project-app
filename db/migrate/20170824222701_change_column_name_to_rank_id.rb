class ChangeColumnNameToRankId < ActiveRecord::Migration[5.1]
  def change
    rename_column :hikes, :category_id, :rank_id
  end
end
