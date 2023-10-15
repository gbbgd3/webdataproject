class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find_by(params[:id])
  end

  def search
    query = params[:search]
    @films = Film.where('title LIKE ?', "%#{query}%").page(params[:page]).per(1)
  end
end
