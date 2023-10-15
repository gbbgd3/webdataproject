class PeopleController < ApplicationController
  def index
    @people = Person.page(params[:page]).per(1)
    @people_count = Person.all.count
  end

  def show
    @person = Person.find_by(id: params[:id])
  end

  def search
    query = params[:search]
    @people = Person.where('name LIKE ?', "%#{query}%").page(params[:page]).per(1)
  end
end
