class Fixdatatypesonuser < ActiveRecord::Migration
  def up
    change_table :users do |t|
         t.change :conference_line, :string
       end
  end

  def down
    change_table :users do |t|
         t.change :conference_line, :number
       end
  end
end
