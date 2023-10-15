class FilmsController < ApplicationController
  def index
    @films = Film.page(params[:page]).per(10)
    @films_count = Film.all.count
  end

  def show
    @film = Film.find_by(id: params[:id])
    @characters = @film.people.limit(10)
  end

  def search
    query = params[:search]
    @films = Film.where('title LIKE ?', "%#{query}%").page(params[:page]).per(10)
  end
end
