# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :size do
    size_name "MyString"
  end
end
# == Schema Information
#
# Table name: sizes
#
#  id         :integer         not null, primary key
#  size_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

