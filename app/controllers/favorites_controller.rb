class FavoritesController < ApplicationController

  def add
    FavoriteWorkout.create(favorite_params)
    redirect_to request.referrer
  end

  def remove
    fav = FavoriteWorkout.find_by(user_id: favorite_params[:user_id], workout_id: favorite_params[:workout_id])
    fav.destroy
    redirect_to request.referrer
  end

private

  def favorite_params
    params.require(:favparams).permit(:user_id, :workout_id)
  end

end
