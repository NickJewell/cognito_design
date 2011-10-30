class CreateTimezones < ActiveRecord::Migration
  def change
    create_table :timezones do |t|
      t.string :timezone_name

      t.timestamps
    end
  end
end
