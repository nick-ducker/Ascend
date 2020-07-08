class WorkoutsController < ApplicationController

  before_action :random_background

  def index
    @loggedin = logged_in_user
    @allworkouts = Workout.where(shared: true)

    # must iterate through collection on desktop
    if current_user
      @myworkouts = Workout.where(user_id: current_user.id)
      
      @favworkouts = Array.new

      current_user.favorite_workouts.each do |fav|
        @favworkouts << fav.workout
      end
    end

  end

  def new
    authorize()
    @workout = Workout.new
  end

  def create
    authorize()
    if current_user.workouts.create(strong_workout_params)
      redirect_to workouts_path, notice: "Workout Created!"
    else
      flash.now.alert = "Workout could not be created. Check your fields and try again"
      render :new
    end
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
    
    if @workout.update(strong_workout_params)
      redirect_to workouts_path, notice: "Workout Updated!"
    else
      flash.now.alert = "Workout could not be updated. Check your fields and try again"
      render :edit
    end
  end

private

  def strong_workout_params
    params.require(:workout).permit(:title, :category, :shared, :description)
  end

end
