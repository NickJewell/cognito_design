# == Schema Information
#
# Table name: timezones
#
#  id            :integer         not null, primary key
#  timezone_name :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
class Timezone < ActiveRecord::Base
  has_many :event_sessions
  
  attr_accessible :timezone_name
  
  validates :timezone_name, :presence => true
end


# == Schema Information
#
# Table name: timezones
#
#  id            :integer         not null, primary key
#  timezone_name :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

