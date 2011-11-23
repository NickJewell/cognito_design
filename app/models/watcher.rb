class Watcher < ActiveRecord::Base
  belongs_to :event,:foreign_key => 'event_id'
  belongs_to :user,:foreign_key => 'user_id'
end
# == Schema Information
#
# Table name: watchers
#
#  id            :integer         not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  attendee_flag :string(255)
#  watch_flag    :string(255)
#  user_id       :integer
#  event_id      :integer
#

