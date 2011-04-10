class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :subject
      t.text :description
      t.integer :submitter_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
