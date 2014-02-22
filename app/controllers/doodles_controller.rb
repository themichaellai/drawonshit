class DoodlesController < ApplicationController
  def index
    @doodles = Doodle.order(:votes)
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
    @doodles = Doodle.order(:created_at)
    render 'index'
  end
end
