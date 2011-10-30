# == Schema Information
#
# Table name: channels
#
#  id           :integer         not null, primary key
#  channel_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Channel < ActiveRecord::Base
  has_many :event_sessions
  
  attr_accessible :channel_name
  
  validates :channel_name, :presence => true
end

