class CreateParks < ActiveRecord::Migration
  def self.up
    create_table :parks do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :parks
  end
end
