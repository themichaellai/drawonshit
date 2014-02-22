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
end
