class CreateEventResources < ActiveRecord::Migration
  def change
    create_table :event_resources do |t|
      t.integer :event_id
      t.integer :resource_id
      t.timestamps
    end
  end
end
