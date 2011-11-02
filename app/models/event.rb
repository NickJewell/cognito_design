# == Schema Information
#
# Table name: event_sessions
#
#  id               :integer         not null, primary key
#  user_host_id     :integer
#  channel_id       :integer
#  difficulty_id    :integer
#  status_id        :integer
#  timezone_id      :integer
#  size_id          :integer
#  title            :string(255)
#  content          :string(255)
#  session_datetime :datetime
#  duration         :integer
#  prereqs          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#


class Event < ActiveRecord::Base
  has_one :channel
  has_one :difficulty
  has_one :size
  has_one :status
  has_one :timezone
  
  #Eventually, this default scope will be removed
  default_scope order('duration ASC')
  
  scope :filter, lambda { |low, high| where(:duration => low..high) }
  
  def self.low_high_durations
    [minimum(:duration), maximum(:duration)]
  end
  
end

