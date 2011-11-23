# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :watcher do
  end
end
# == Schema Information
#
# Table name: watchers
#
#  id            :integer         not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  attendee_flag :string(255)
#  watch_flag    :string(255)
#  user_id       :integer
#  event_id      :integer
#

