class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    user = User.find_by(email: params[:login][:email].downcase)

    if user && user.authenticate(params[:login][:password])

      if user.email_confirmed
        session[:user_id] = user.id.to_s
        redirect_to root_path, notice: "Successfully logged in!"
      else
        flash.now[:error] = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed'
        render :new
      end

    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

end
