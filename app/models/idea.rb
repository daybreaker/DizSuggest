class Idea < ActiveRecord::Base
  belongs_to :submitter, :class_name => "User"
  
  make_voteable
  
  attr_accessible :subject, :description, :submitter_id
end
