
# == Schema Information
#
# Table name: tags
#
#  id   :integer         not null, primary key
#  name :string(255)
#

class Tag < ActiveRecord::Base
  
  has_many :event_tags
  has_many :events, :through => :event_tags
  
  attr_accessible :name
  
end


