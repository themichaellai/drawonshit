class DoodlesController < ApplicationController
  include ApplicationHelper
  before_filter :prompt_if_not_signed_in,
    except: [:index, :recent, :about, :show, :upvote, :downvote]
  before_filter :authenticate_user!, only: [:upvote, :downvote]
  before_filter :redirect_if_not_admin, only: :destroy

  def index
    @doodles = Doodle.paginate(page: params[:page]).order('cached_votes_score DESC')
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
    @doodles = Doodle.paginate(page: params[:page]).order('created_at DESC')
    render 'index'
  end

  def upvote
    @doodle = Doodle.find(params[:id])
    if current_user.voted_up_on? @doodle
      @doodle.unliked_by current_user
    else
      @doodle.liked_by current_user
    end
    render json: {upvotes: @doodle.votes.up.size,
                  downvotes: @doodle.votes.down.size,
                  id: @doodle.id}
  end

  def downvote
    @doodle = Doodle.find(params[:id])
    if current_user.voted_down_on? @doodle
      @doodle.undisliked_by current_user
    else
      @doodle.downvote_from current_user
    end
    render json: {upvotes: @doodle.votes.up.size,
                  downvotes: @doodle.votes.down.size,
                  id: @doodle.id}
  end

  def mine
    @doodles = current_user.doodles
    @dont = true
    render 'index'
  end

  def show
    @doodle = Doodle.find(params[:id])
  end

  def destroy
    @doodle = Doodle.find(params[:id])
    @doodle.destroy
    redirect_to doodles_path
  end
end
