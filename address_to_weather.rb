require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
street_address = gets.chomp
url_safe_street_address = URI.encode(street_address)

url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
raw_data = open(url_of_data_we_want).read
require 'json'
parsed_data = JSON.parse(raw_data)
results = parsed_data["results"]
first = results[0]
geometry = first["geometry"]
location = geometry["location"]
the_latitude = location["lat"]
the_longitude = location["lng"]

url_of_data_we_want2 = "https://api.forecast.io/forecast/a656bc784700cc4e1d9453858fe725b2/#{the_latitude},#{the_longitude}"
raw_data2 = open(url_of_data_we_want2).read
parsed_data2 = JSON.parse(raw_data2)
results2 = parsed_data2["results"]
the_temperature = parsed_data2["currently"]["temperature"]
the_hour_outlook = parsed_data2["hourly"]["summary"]
the_day_outlook = parsed_data2["daily"]["summary"]	
# Your code goes below.

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{street_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
