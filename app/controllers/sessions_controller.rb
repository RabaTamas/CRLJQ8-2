class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email]&.downcase)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Üdvözöljük, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Hibás email cím vagy jelszó.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Sikeresen kijelentkezett.'
    redirect_to root_path
  end
end
