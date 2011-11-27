class AddEventIdtoResources < ActiveRecord::Migration
  def up
        add_column :resources, :event_id, :integer
  end

  def down
        remove_column :resources, :event_id
  end
end
