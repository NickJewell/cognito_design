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

    attr_accessible :resource_url, :resource_description, :ext_int_indicator
    

    

  
    belongs_to :user,:foreign_key => 'user_id'
    belongs_to :event, :foreign_key => 'event_id'
    
    accepts_nested_attributes_for :event, :update_only => true
      
end

