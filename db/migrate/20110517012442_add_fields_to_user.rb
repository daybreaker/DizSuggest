class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :photo, :string
    add_column :users, :name, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :photo
  end
end
