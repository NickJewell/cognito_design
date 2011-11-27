class EventResource < ActiveRecord::Base
  # == Schema Information
  #
  # Table name: event_resources
  #
  #  id          :integer         not null, primary key
  #  event_id    :integer
  #  resource_id :integer
  #  created_at  :datetime
  #  updated_at  :datetime
  #


  belongs_to :event,:foreign_key => 'event_id'
  belongs_to :resource,:foreign_key => 'resource_id'
end


# == Schema Information
#
# Table name: event_resources
#
#  id          :integer         not null, primary key
#  event_id    :integer
#  resource_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

