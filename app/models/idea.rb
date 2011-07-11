class Idea < ActiveRecord::Base
  belongs_to :submitter, :class_name => "User"
  
  acts_as_voteable
  acts_as_commentable
  acts_as_taggable

  attr_accessible :subject, :description, :submitter_id
  
  def self.newest(limit=0)
    limit == 0 ? order("created_at DESC") : order("created_at DESC").limit(limit)
  end 
  
  def self.top(limit=0)
    t = select('ideas.*, sum(votes.vote) as sum_votes').joins("LEFT JOIN votes ON votes.voteable_id = ideas.id").group('votes.voteable_id').order('sum_votes DESC')
    limit == 0 ? t : t.limit(limit)
  end
end
