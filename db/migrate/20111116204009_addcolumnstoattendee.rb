class Addcolumnstoattendee < ActiveRecord::Migration
  def change
        add_column :attendees, :user_id, :integer
        add_column :attendees, :event_id, :integer
  end

end
