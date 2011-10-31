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
                         {timezone_name: 'Eastern USA & Latin America'},
                         {timezone_name: 'Western USA'}
                      ])