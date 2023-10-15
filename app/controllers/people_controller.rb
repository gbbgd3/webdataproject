class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find_by(params[:id])
  end

  def search
    query = params[:search]
    @people = Person.where("name LIKE ?", "%#{query}%")
  end
end
