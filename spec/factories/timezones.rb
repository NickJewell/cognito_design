# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timezone do
    timezone_name "MyString"
  end
end
# == Schema Information
#
# Table name: timezones
#
#  id            :integer         not null, primary key
#  timezone_name :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

