class CreateDifficulties < ActiveRecord::Migration
  def change
    create_table :difficulties do |t|
      t.string :difficulty_name

      t.timestamps
    end
  end
end
