class SpeciesController < ApplicationController
  def index
    @species = Species.page(params[:page]).per(5)
    @species_count = Species.all.count
  end

  def show
    @specific_species = Species.find_by(id: params[:id])
    @people = @specific_species.people.limit(10)
  end

  def search
    query = params[:search]
    @species = Species.where('name LIKE ?', "%#{query}%").page(params[:page]).per(5)
  end
end
