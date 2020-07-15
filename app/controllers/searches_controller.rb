class SearchesController < ApplicationController

  def ticksearch
    term = strong_search

    case
      when term[:searchtype] == "date"
        term[:searchtype] = "cast(date as text)"
      when term[:searchtype] == "grade"
        term[:searchtype] = "cast(grade as text)"
      else
        term[:searchterm] = term[:searchterm].downcase
    end

    @ticks = Tick.where("#{term[:searchtype]} LIKE ?", "%#{term[:searchterm]}%").group_by(&:date).sort.reverse.to_h

    render "ticks/index"
  end

  def workoutsearch

    term = strong_search

    case
    when term[:searchtype] == "date"
      term[:searchtype] = "cast(date as text)"
    else
      term[:searchterm] = term[:searchterm].downcase
    end

    @allworkouts = Workout.where("#{term[:searchtype]} LIKE ?", "%#{term[:searchterm]}%").select{|work| work.shared == true}

    render "workouts/index"

  end

private

  def strong_search
    term = params.require(:search).permit(:searchterm, :searchtype)
  end

end
