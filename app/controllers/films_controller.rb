class FilmsController < ApplicationController
  def index
    @films = Film.page(params[:page]).per(2)
  end

  def show
    @film = Film.find_by(params[:id])
    @characters = @film.people.limit(10)
  end

  def search
    query = params[:search]
    @films = Film.where('title LIKE ?', "%#{query}%").page(params[:page]).per(1)
  end
end
