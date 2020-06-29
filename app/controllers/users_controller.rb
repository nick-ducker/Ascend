class UsersController < ApplicationController

  def new
    redirect_to new_session_path

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!

    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:notice] = "Please confirm your email address to continue"
      redirect_to root_path
    else
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to root_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
