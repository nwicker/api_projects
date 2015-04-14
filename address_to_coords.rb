require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "What is the address you would like to find the latitude and longitude of?"

# Gets a string from the user and chomps off the carriage return at the end
street_address = gets.chomp

# Replaces spaces and other URL-illegal characters in the string
url_safe_street_address = URI.encode(street_address)

# Your code goes below. Hints:

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


# Let's store the latitude in a variable called 'the_latitude',
#   and the longitude in a variable called 'the_longitude'.


# Ultimately, we want the following line to work when uncommented:

puts "The latitude of #{street_address} is #{the_latitude} and the longitude is #{the_longitude}."
