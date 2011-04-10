class Idea < ActiveRecord::Base
  has_one :user, :as => :submitter
  
  attr_accessible :subject, :description, :submitter_id
end
