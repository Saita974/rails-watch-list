# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts '> Destroying movie database'
Movie.destroy_all

puts '_/ Movie database destroyed'
puts '> Creating movies'

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies['results'].each do |movie|
  title = movie['original_title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
  puts '> one movie created'
end

List.create(name: 'Comedy')
List.create(name: 'Drama')
List.create(name: 'Action')
List.create(name: 'Thriller')
List.create(name: 'Fantastic')

puts '> Finished'
