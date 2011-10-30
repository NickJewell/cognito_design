# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_session do
    user_host_id 1
    channel_id 1
    difficulty_id 1
    status_id 1
    timezone_id 1
    size_id 1
    title "MyString"
    content "MyString"
    session_datetime "2011-10-30 22:42:47"
    duration 1
    prereqs "MyString"
  end
end
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

