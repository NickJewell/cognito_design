module EventsHelper
  
  def conditional_delete_button(event_id)
    
    @event = Event.find(event_id)
    
    button_to 'Delete', {  		:controller => :events,
  										        :action 	=> "destroy", 
  										        :id => @event.id},
  										      :confirm	=> 'Really destroy this event?',
  										      :method 	=> :delete
  end
  
  def conditional_edit_link(event_id)
    
    @event = Event.find(event_id)
    
    link_to "Edit", edit_event_path(@event.id) 
    
  end
  
end