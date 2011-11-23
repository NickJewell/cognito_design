require 'spec_helper'

describe User do
  it "should create a new instance given a valid attribute" do
    User.create!(:name => "Test", :email => "user@user.com")
  end
end
# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean         default(FALSE)
#  staff_id           :string(255)
#  city               :string(255)
#  phone              :string(255)
#  phone_alt          :string(255)
#  conference_line    :string(255)
#  webex_details      :string(255)
#  vc_details         :string(255)
#  MBTI               :string(255)
#  reputation         :decimal(, )
#

