# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :difficulty do
    difficulty_name "MyString"
  end
end
# == Schema Information
#
# Table name: difficulties
#
#  id              :integer         not null, primary key
#  difficulty_name :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

