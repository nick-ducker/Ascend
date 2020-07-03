class PeriodsController < ApplicationController

  before_action :random_background

  def index
    @loggedin = logged_in_user
    @periods = Period.where(shared: true).where(user_id: current_user.id)
  end

  def new
    authorize()
  end

  def create
    authorize()
  end

  def show
    authorize()
    @period = Period.find(params[:id])
  end

  def edit
    authorize()
    @period = Period.find(params[:id])
  end
  
  def update
    authorize()
    @period = Period.find(params[:id])
  end

end

