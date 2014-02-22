class DoodlesController < ApplicationController
  def index
    @doodles = Doodle.all
  end

  def new
    @doodle = Doodle.new
  end

  def create
    @doodle = Doodle.new params[:doodle]
    if @doodle.save
      redirect_to doodles_path
    else
      render 'new'
    end
  end

  def recent
    @doodles = Doodle.find(order: 'created_at DESC')
  end

  def upvote
    @doodle = Doodle.find(params[:id])
    @doodle.liked_by current_user
    render json: {upvotes: @doodle.votes.up.size, 
                  downvotes: @doodle.votes.down.size,
                  id: @doodle.id}
  end

  def downvote
    @doodle = Doodle.find(params[:id])
    @doodle.downvote_from current_user
    render json: {upvotes: @doodle.votes.up.size, 
                  downvotes: @doodle.votes.down.size,
                  id: @doodle.id}
  end
end
