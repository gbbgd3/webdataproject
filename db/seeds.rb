# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'net/http'
require 'json'

# fetch and parse
def fetch_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# fetches all data
# def fetch_all_data(url)
#   all_data = []
#   next_url = url

#   while next_url
#     response = fetch_data(next_url)
#     all_data += response['results']
#     next_url = response['next']
#   end

#   all_data
# end

films_data = fetch_data('https://swapi.dev/api/films/')
people_data = fetch_data('https://swapi.dev/api/people/')
species_data = fetch_data('https://swapi.dev/api/species/')

# Fill database with species
species_data['results'].each do |data|
  Species.create(
    name: data['name'],
    classification: data['classification'],
    average_lifespan: data['average_lifespan'],
    url: data['url']
  )
end

# Fill database with films
films_data['results'].each do |data|
  Film.create(
    opening_crawl: data['opening_crawl'],
    release_date: data['release_date'],
    title: data['title'],
    url: data['url']
  )
end

# Fill database with people
people_data['results'].each do |data|
  species_url = data['species'][0]
  species = Species.find_by(url: species_url)

  next if species.nil?

  Person.create(
    name: data['name'],
    birth_year: data['birth_year'],
    height: data['height'],
    gender: data['gender'],
    url: data['url'],
    species_id: species.id
  )
end

# Fill the join FilmPerson table
films_data['results'].each do |data|
  film = Film.find_by(url: data['url'])

  data['characters'].each do |character_url|
    person = Person.find_by(url: character_url)
    FilmsPerson.create(film_id: film.id, person_id: person.id) if person && film
  end
end
