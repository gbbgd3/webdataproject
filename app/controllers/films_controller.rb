class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find_by(params[:id])
  end
end
