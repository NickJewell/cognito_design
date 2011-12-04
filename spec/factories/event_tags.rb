# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_tag do
    event_id ""
    tag_id 1
  end
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

