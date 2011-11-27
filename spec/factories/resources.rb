# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    ext_int_indicator "MyString"
    resource_url "MyString"
    resource_description "MyString"
    created_by_user ""
  end
end
# == Schema Information
#
# Table name: resources
#
#  id                   :integer         not null, primary key
#  ext_int_indicator    :string(255)
#  resource_url         :string(255)
#  resource_description :string(255)
#  user_id              :integer
#  created_at           :datetime
#  updated_at           :datetime
#  event_id             :integer
#

