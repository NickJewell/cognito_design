class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :ext_int_indicator
      t.string :resource_url
      t.string :resource_description
      t.integer :created_by_user

      t.timestamps
    end
  end
end
