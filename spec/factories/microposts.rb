# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :micropost do
    content "MyString"
    user_id 1
  end
end
# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

