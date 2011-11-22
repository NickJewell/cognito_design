class AddColumnsToWatchers < ActiveRecord::Migration
  def change
    add_column :watchers, :attendee_flag, :string
    add_column :watchers, :watch_flag, :string
    add_column :watchers, :user_id, :integer
    add_column :watchers, :event_id, :integer
  end
end
