class PlansController < ApplicationController

  before_action :random_background

  def index
    @loggedin = logged_in_user
    @plans = Plan.where(shared: true).where(user_id: current_user.id)
  end

  def new
    authorize()
  end

  def create
    authorize()
  end

  def show
    authorize()
    @plan = Plan.find(params[:id])
  end

  def edit
    authorize()
    @plan = Plan.find(params[:id])
  end
  
  def update
    authorize()
    @plan = Plan.find(params[:id])
  end

end
