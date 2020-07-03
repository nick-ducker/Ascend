class StaticpagesController < ApplicationController

  def help 
  end

  def training
    @randomback = random_background
  end
  
end
