class CreateMakeVoteableTables < ActiveRecord::Migration
   def self.up
     create_table :votings do |t|
       t.string :voteable_type
       t.integer :voteable_id
       t.string :voter_type
       t.integer :voter_id
       t.boolean :up_vote, :null => false

       t.timestamps
    end

    add_column :users, :up_votes, :integer, :null => false, :default => 0
    add_column :users, :down_votes, :integer, :null => false, :default => 0
    add_column :ideas, :up_votes, :integer, :null => false, :default => 0
    add_column :ideas, :down_votes, :integer, :null => false, :default => 0

    
    add_index :votings, [:voteable_type, :voteable_id]
    add_index :votings, [:voter_type, :voter_id]
    add_index :votings, [:voteable_type, :voteable_id, :voter_type, :voter_id], :name => "unique_voters", :unique => true
  end

  def self.down
    remove_index :votings, :column => [:voteable_type, :voteable_id]
    remove_index :votings, :column => [:voter_type, :voter_id]
    remove_index :votings, :name => "unique_voters"
    
    drop_table :votings
    
    remove_column :users, :up_votes
    remove_column :users, :down_votes
    remove_column :ideas, :up_votes
    remove_column :ideas, :down_votes
  end
end
