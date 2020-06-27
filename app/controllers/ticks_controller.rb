class TicksController < ApplicationController
  def index
    authorize()
    @randomback = random_background
    @ticks = Tick.where(user_id: current_user.id).group_by(&:date).sort.reverse.to_h if current_user
  end

  def new
    authorize()
    @randomback = random_background
    @number = strong_new_params[:number].to_i
    puts @number
  end

  def create
    authorize()

    @comparitive = comparitive_params()
    @successarray = Array.new
    @failurearray = Array.new
    n = 1

    datahash = params.select{|x| x.to_i > 0}
    datahash.each_key do |key|
      tick = Tick.new
      datahash[key].each do |k,v|
        if @comparitive.include?(k)
          tick[k.to_sym] = v.class == String ? v.downcase : v 
        else
          next
        end
      end
      tick.user_id = current_user.id if current_user
      if tick.save
        @successarray << "Tick #{n}"
      else
        @failurearray << "Tick #{n}"
      end
      n += 1
    end

    flash[:notice] = "Saved: #{@successarray.join(', ')} // Not Saved: #{@failurearray.join(', ')}"
    redirect_to root_path
  end

  def show
    authorize()
    
    @tick = Tick.find(params[:id])
  end

  def edit
    authorize()
    @randomback = random_background
    @tick = Tick.find(params[:id])
  end

  def update
    authorize()

    @tick = Tick.find(params[:id])
    if @tick.update(strong_params)
      redirect_to ticks_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize()
    tick = Tick.find(params[:id])
    tick.destroy
    flash[:notice] = "Tick successfully deleted."
    redirect_to root_path
  end

  private

  def comparitive_params
    permittedparams = ["date", "name", "climbtype", "grade", "style", "crag", "comment", "beta"]
  end

  def strong_params
    params.require(:tick).permit(:date,:name,:climbtype,:grade,:style,:crag,:comment,:beta)
  end

  def strong_new_params
    params.require(:val).permit(:number)
  end
end
