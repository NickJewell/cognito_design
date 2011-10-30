# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status do
    status_name "MyString"
  end
end
# == Schema Information
#
# Table name: statuses
#
#  id          :integer         not null, primary key
#  status_name :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

