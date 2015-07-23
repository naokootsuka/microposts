class AddProfielToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profie, :string
  end
end
