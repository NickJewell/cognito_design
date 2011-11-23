# == Schema Information
#
# Table name: statuses
#
#  id          :integer         not null, primary key
#  status_name :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
class Status < ActiveRecord::Base
  has_many :event_sessions
  
  attr_accessible :status_name
  
  validates :status_name, :presence => true
end


# == Schema Information
#
# Table name: statuses
#
#  id          :integer         not null, primary key
#  status_name :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

