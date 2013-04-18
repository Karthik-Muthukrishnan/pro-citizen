class CreateUserAreaRelations < ActiveRecord::Migration
  def change
    create_table :user_area_relations do |t|
      t.integer :user_id
      t.integer :area_id

      t.timestamps
    end
    add_index :user_area_relations, :user_id
    add_index :user_area_relations, :area_id
    add_index :user_area_relations, [:user_id, :area_id], unique: true
  end
end
