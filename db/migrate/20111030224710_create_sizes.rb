class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :size_name

      t.timestamps
    end
  end
end
