class CreateWatchers < ActiveRecord::Migration
  def change
    create_table :watchers do |t|

      t.timestamps
    end
  end
end
