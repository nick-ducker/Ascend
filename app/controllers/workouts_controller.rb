class WorkoutsController < ApplicationController

  before_action :random_background

  def index
    @loggedin = logged_in_user
    @workouts = Workout.where(shared: true).where(user_id: current_user.id)
  end

  def new
    authorize()
  end

  def create
    authorize()
  end

  def show
    authorize()
    @workout = Workout.find(params[:id])
  end

  def edit
    authorize()
    @workout = Workout.find(params[:id])
  end
  
  def update
    authorize()
    @workout = Workout.find(params[:id])
  end

end
