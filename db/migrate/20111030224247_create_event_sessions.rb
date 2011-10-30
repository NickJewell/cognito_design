class CreateEventSessions < ActiveRecord::Migration
  def change
    create_table :event_sessions do |t|
      t.integer :user_host_id
      t.integer :channel_id
      t.integer :difficulty_id
      t.integer :status_id
      t.integer :timezone_id
      t.integer :size_id
      t.string :title
      t.string :content
      t.datetime :session_datetime
      t.integer :duration
      t.string :prereqs

      t.timestamps
    end
  end
end
