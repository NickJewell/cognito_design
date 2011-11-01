class Addcolumnstouser < ActiveRecord::Migration
  def up
    add_column :users, :staff_id, :string
    add_column :users, :city, :string
    add_column :users, :phone, :string
    add_column :users, :phone_alt, :string
    add_column :users, :conference_line, :string
    add_column :users, :webex_details, :string
    add_column :users, :vc_details, :string
    add_column :users, :MBTI, :string
    add_column :users, :reputation, :integer
  end

  def down
    remove_column :users, :staff_id
    remove_column :users, :city
    remove_column :users, :phone
    remove_column :users, :phone_alt
    remove_column :users, :conference_line
    remove_column :users, :webex_details
    remove_column :users, :vc_details
    remove_column :users, :MBTI
    remove_column :users, :reputation
  end
end
