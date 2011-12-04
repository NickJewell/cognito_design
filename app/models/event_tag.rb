class EventTag < ActiveRecord::Base
  # == Schema Information
  #
  # Table name: event_tags
  #
  #  id         :integer         not null, primary key
  #  event_id   :integer
  #  tag_id     :integer
  #  created_at :datetime
  #  updated_at :datetime
  #
  
  belongs_to :event,:foreign_key => 'event_id'
  belongs_to :tag,:foreign_key => 'tag_id'
end


# == Schema Information
#
# Table name: event_tags
#
#  id         :integer         not null, primary key
#  event_id   :integer
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

