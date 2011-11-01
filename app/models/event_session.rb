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


class EventSession < ActiveRecord::Base
  
end
