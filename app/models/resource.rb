class Resource < ActiveRecord::Base
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


  
    belongs_to :user,:foreign_key => 'user_id'
    belongs_to :event, :foreign_key => 'event_id'
      
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

