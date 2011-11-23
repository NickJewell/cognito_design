class Attendee < ActiveRecord::Base
  belongs_to :event,:foreign_key => 'event_id'
  belongs_to :user,:foreign_key => 'user_id'
  
end
# == Schema Information
#
# Table name: attendees
#
#  id            :integer         not null, primary key
#  attendee_flag :string(255)
#  watch_flag    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  event_id      :integer
#

