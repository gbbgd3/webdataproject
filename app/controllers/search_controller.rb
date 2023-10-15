class SearchController < ApplicationController
  def search_redirect
    query = params[:search]
    category = params[:category]

    if category == 'People'
      redirect_to people_search_path(search: query)
    elsif category == 'Films'
      redirect_to films_search_path(search: query)
    elsif category == 'Species'
      redirect_to species_search_path(search: query)
    end
  end
end
