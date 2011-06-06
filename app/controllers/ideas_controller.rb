class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    if (request.xhr?)
      render :layout => false
    end
  end

  def show
    @idea = Idea.find(params[:id])
    if (request.xhr?)
      render :layout => false
    end
  end
  
  def new
    @idea = Idea.new
    @attractions = Hash.new
    @types = $types
    @locations = $locations
 #   @locations.each_key{|x| @attractions[x] = Attraction.find_all_for_location(x)}
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
    @attractions = Hash.new
    @types = $types
    @locations = $locations
 #   @locations.each_key{|x| @attractions[x] = Attraction.find_all_for_location(x)}
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
    current_user.vote_exclusively_for(idea)
    render :nothing => true

  end
  
  def downvote
    idea = Idea.find(params[:id])
    current_user.vote_exclusively_against(idea)
    render :nothing => true
  end
  
  def new_comment
    @idea = Idea.find(params[:id])
    @parent_id = (!params[:comment].blank?) ? params[:comment] : false;
    render :layout => false
  end
  
  def create_comment
    @idea = Idea.find(params[:id])
    comment = Comment.build_from(@idea, current_user.id, params[:comment])
    comment.save
    comment.move_to_child_of(Comment.find(params[:parent_id])) if !params[:parent_id].blank?
    redirect_to idea_path(@idea)
  end
    
end
