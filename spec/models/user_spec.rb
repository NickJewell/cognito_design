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
#

