class Idea < ActiveRecord::Base
  attr_accessible :subject, :description, :submitter_id
end
