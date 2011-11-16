class Attendee < ActiveRecord::Base
  belongs_to :event,:foreign_key => 'event_id'
  belongs_to :user,:foreign_key => 'user_id'
  
end
