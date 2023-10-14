class SpeciesController < ApplicationController
  def index
    @species = Species.all
  end

  def show
    @specific_species = Species.find_by(params[:id])
  end
end
