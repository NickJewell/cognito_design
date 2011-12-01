# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    primary.item :events, 'Events', events_path
    primary.item :resources, 'Resources', resources_path
    primary.item :users, 'Users', users_path

  end

end
