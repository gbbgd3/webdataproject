class SpeciesController < ApplicationController
  def index
    @species = Species.page(params[:page]).per(10)
  end

  def show
    @specific_species = Species.find_by(params[:id])
  end

  def search
    query = params[:search]
    @species = Species.where('name LIKE ?', "%#{query}%").page(params[:page]).per(10)
  end
end
