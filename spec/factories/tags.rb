# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    tag_name "MyString"
  end
end
# == Schema Information
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  tag_name   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

