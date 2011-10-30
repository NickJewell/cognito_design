# == Schema Information
#
# Table name: sizes
#
#  id         :integer         not null, primary key
#  size_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Size < ActiveRecord::Base
  has_many :event_sessions
  
  attr_accessible :size_name
  
  validates :size_name, :presence => true
end


