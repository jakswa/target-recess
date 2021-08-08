class HomeController < ApplicationController
  def landing
    @logged_in = session[:tp_token].present?
    @my_stuff = Teepee.new(session[:tp_token]).my_stuff if @logged_in
  end
end
