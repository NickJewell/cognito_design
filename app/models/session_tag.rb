class SessionTag < ActiveRecord::Base
  belongs_to :event,:foreign_key => 'event_id'
  belongs_to :tag,:foreign_key => 'tag_id'
end
