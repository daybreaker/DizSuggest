class PagesController < ApplicationController
  def about
  end

  def contact
  end
  
  def index
    @new_ideas = Idea.newest(2)
    @top_ideas = Idea.top(2)
  end

end
