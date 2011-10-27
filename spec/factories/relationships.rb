# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :relationship do
    follower_id 1
    followed_id 1
  end
end
# == Schema Information
#
# Table name: relationships
#
#  id          :integer         not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

