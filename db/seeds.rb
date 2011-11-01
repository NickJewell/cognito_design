# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Timezones

tz = Timezone.create!(
                      [  {timezone_name: 'Asia Pacific Region'}, 
                         {timezone_name: 'Indian Region'},
                         {timezone_name: 'EMEA Region'},
                         {timezone_name: 'Americas Region'},
                         {timezone_name: 'Flexible'}
                      ])
                      
ch = Channel.create!(
                      [  {channel_name: 'In Person'}, 
                         {channel_name: 'Phone/Conference'},
                         {channel_name: 'Webex'},
                         {channel_name: 'Video Conference'}
                      ])                 
                      
df = Difficulty.create!(
                      [ {difficulty_name: 'Beginner'},
                        {difficulty_name: 'Intermediate'},
                        {difficulty_name: 'Advanced'}
                      ])         

sz = Size.create!(
                  [{size_name:'Duet (1-on-1)'},
                   {size_name:'Huddle (2 to 9)'},
                   {size_name:'Performance (10 to 49)'},
                   {size_name:'Jamboree! (50+)'}
                  ])
                  
status = Status.create!(
                        [{status_name:'Under Proposal'},
                         {status_name:'Booking'},
                         {status_name:'Fully Booked!'},
                         {status_name:'Completed'},
                         {status_name:'Cancelled'}])                                                     