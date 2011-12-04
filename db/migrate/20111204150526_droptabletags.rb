class Droptabletags < ActiveRecord::Migration
  def up
    drop_table :tags
    drop_table :taggings
  end

  def down
  end
end
