class CreateHikes < ActiveRecord::Migration[5.1]
  def change
    create_table :hikes do |t|
      t.string  :name
      t.string  :location
      t.string  :description 
      t.integer :user_id
      t.integer :category_id
    end
  end
end
