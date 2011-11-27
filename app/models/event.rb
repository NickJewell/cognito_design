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
  
  has_many :attendees
  has_many :users, :through => :attendees
  
  has_many :watchers
  has_many :users, :through => :watchers
  
  has_many :resources
  
  accepts_nested_attributes_for :resources
  
  attr_taggable :tags
  
  acts_as_voteable
  

  attr_accessible :user_host_id, :channel_id, :difficulty_id, :status_id, :timezone_id, :size_id, :title, :content, :session_datetime, :duration, :prereqs

  class << self
    def check_owner(host, user)
      host == user ? true : false
    end
  end
  
end

