class CreateAttendees < ActiveRecord::Migration
    def change
      create_table :attendees do |t|
        t.string :attendee_flag
        t.string :watch_flag

        t.timestamps
      end
    end
  end