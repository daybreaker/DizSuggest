class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
    @attractions = Hash.new
    @types = $types
    @locations = $locations
    @locations.each_key{|x| @attractions[x] = Attraction.find_all_for_location(x)}
  end

  def create
    @idea = Idea.new(params[:idea])
    
    @idea.submitter_id = current_user.id
    
    if @idea.save
      redirect_to ideas_url, :notice => "Successfully created idea."
    else
      render :action => 'new'
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      redirect_to ideas_url, :notice  => "Successfully updated idea."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_url, :notice => "Successfully destroyed idea."
  end
  
  def upvote
    idea = Idea.find(params[:id])
    current_user.up_vote(idea)
    render :nothing => true

  end
  
  def downvote
    idea = Idea.find(params[:id])
    current_user.down_vote(idea)
    render :nothing => true
  end
    
end
