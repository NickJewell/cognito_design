# == Schema Information
#
# Table name: difficulties
#
#  id              :integer         not null, primary key
#  difficulty_name :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
class Difficulty < ActiveRecord::Base
  has_many :event_sessions
 
  attr_accessible :difficulty_name 
  
  validates :difficulty_name, :presence => true

end


