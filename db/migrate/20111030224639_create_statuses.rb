class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status_name

      t.timestamps
    end
  end
end
