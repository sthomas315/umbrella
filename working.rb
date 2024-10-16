require "http"
require "json"
pirate_weather_api_key = "3RrQrvLmiUayQ84JSxL8D2aXw99yRKlx1N4qFDUE"
google_maps_api_key = "AIzaSyDKz4Y3bvrTsWpPRNn9ab55OkmcwZxLOHI"

pp "Where are you located?"
location = gets.chomp

#getting coordinates
google_maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{google_maps_api_key}"
raw_goog = HTTP.get(google_maps_url)
parsed_response = JSON.parse(raw_goog)
coordinates_lat = parsed_response.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lat")
coordinates_long = parsed_response.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lng")


#weather at coordinates
pirate_maps_url = "https://api.pirateweather.net/forecast/#{pirate_weather_api_key}/#{coordinates_lat},#{coordinates_long}"
raw_pirate = HTTP.get(pirate_maps_url)
parsed_response_1 = JSON.parse(raw_pirate)
pp parsed_response_1
pp parsed_response_1.keys
