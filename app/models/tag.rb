# == Schema Information
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  tag_name   :string(255)
#  created_at :datetime
#  updated_at :datetime
#
class Tag < ActiveRecord::Base
  
  has_many :sessiontags
  has_many :events, :through => :sessiontags
  
  attr_accessible :tag_name
  
end


# == Schema Information
#
# Table name: tags
#
#  id   :integer         not null, primary key
#  name :string(255)
#

