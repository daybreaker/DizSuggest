class Idea < ActiveRecord::Base
  belongs_to :submitter, :class_name => "User"
  
  #make_voteable
  acts_as_voteable
  acts_as_commentable

  # type => new, improvement, fix
  # location => DL, DCA, MK, DHS, Epcot, AK, DWP, DWT
  # location_type => 'dining', 'attraction', 'hotel', 'landscaping'
  # location_detail => eg: Astro-Orbiter, Main Street Electrical Parade, Space Mountain, Le Cellier, Lagoon
  acts_as_taggable
#  acts_as_taggable_on :type, :location, :location_detail, :other
#  acts_as_taggable_on :tag_list
  
  attr_accessible :subject, :description, :submitter_id
end
