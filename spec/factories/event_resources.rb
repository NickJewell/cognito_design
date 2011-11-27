# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_resource do
  end
end
# == Schema Information
#
# Table name: event_resources
#
#  id          :integer         not null, primary key
#  event_id    :integer
#  resource_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

