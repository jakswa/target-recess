class Teepee::EntitiesController < ApplicationController
  def show
    @entity = teepee.entity(params[:id])
  end

  private

  def teepee
    @teepee ||= Teepee.new(session[:tp_token])
  end
end
