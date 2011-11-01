class Altertableeventsessions < ActiveRecord::Migration
  def up
    rename_table :event_sessions, :events
  end

  def down
    rename_table :events, :event_sessions
  end
end
