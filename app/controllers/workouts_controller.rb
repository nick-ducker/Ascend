class WorkoutsController < ApplicationController

  before_action :random_background

  def index
    @loggedin = logged_in_user
    @allworkouts = Workout.where(shared: true)
    @myworkouts = Workout.where(user_id: current_user.id)

    # must iterate through collection on desktop
    @favworkouts = Array.new

    current_user.favorite_workouts.each do |fav|
      @favworkouts << fav.workout
    end
    
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
