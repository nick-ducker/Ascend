class SearchesController < ApplicationController

  def new
    @randomback = random_background
    term = strong_search

    case
      when term[:searchtype] == "date"
        term[:searchtype] = "cast(date as text)"
      when term[:searchtype] == "grade"
        term[:searchtype] = "cast(grade as text)"
      else
        term[:searchterm] = term[:searchterm].downcase
    end

    @ticks = Tick.where("#{term[:searchtype]} LIKE ?", "%#{term[:searchterm]}%").group_by(&:date)

    pp @ticks

    render "ticks/index"
  end

private

  def strong_search
    params.require(:search).permit(:searchterm, :searchtype)
  end

end
