class SessionsController < ApplicationController
  def create
    session[:tp_token] = params.require(:tp_token)
    flash[:notice] = "TP Token set!"
    redirect_to '/'
  end

  def destroy
    session.delete(:tp_token)
    flash[:notice] = "Your token is deleted from the cookie."
    redirect_to '/'
  end
end
