class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to :root
  end

  def new
    @username = nil
  end

  def create
    @username = params[:username]
    user = User.authenticate(@username, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      @error = "Invalid email or password."
      render template: 'sessions/new'   
    end
  end
end