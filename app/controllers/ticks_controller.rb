class TicksController < ApplicationController
  def index
    authorize()

    @ticks = Tick.all
  end

  def new
    authorize()

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
          tick[k.to_sym] = v
        else
          next
        end
      end
      if tick.save
        @successarray << "Tick #{n} was saved successfully"
      else
        @failurearray << "Tick #{n} did not save successfully :("
      end
      n += 1
    end

    render 'create'
  end

  def show
    authorize()
    
    @tick = Tick.find(params[:id])
  end

  def edit
    authorize()

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

  def delete
    authorize()

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
