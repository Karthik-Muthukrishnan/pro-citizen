class AddIndexToAreaName < ActiveRecord::Migration
  def change
  	add_index :areas, :name, unique: true
  end
end
