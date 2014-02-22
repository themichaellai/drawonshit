class DoodlesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :recent]

  def index
    @doodles = Doodle.order(:votes)
  end

  def new
    @doodle = Doodle.new
  end

  def create
    @doodle = Doodle.new params[:doodle]
    @doodle.user = current_user
    if @doodle.save
      redirect_to doodles_path
    else
      render 'new'
    end
  end

  def recent
    @doodles = Doodle.order('created_at DESC')
    render 'index'
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

  def mine
    @doodles = current_user.doodles
    render 'index'
  end
end
