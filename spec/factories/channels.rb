# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :channel do
    channel_name "MyString"
  end
end
# == Schema Information
#
# Table name: channels
#
#  id           :integer         not null, primary key
#  channel_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

