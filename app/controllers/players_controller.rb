class PlayersController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!, only: [:create, :draw]
  before_filter :redirect_if_not_admin, only: :new
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new params[:player]
    if @player.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def draw
    @doodle = Doodle.new
    @player = Player.find params[:player_id]
  end
end
