class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find_by(params[:id])
  end

  def show; end
end
