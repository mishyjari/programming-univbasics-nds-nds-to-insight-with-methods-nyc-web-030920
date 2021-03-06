$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input

def gross_for_director(director_data) 

  director_movies = {} # Will store movie data for the matching director
  director_gross = 0
  
  # Find matching names and return a hash with movie data
  i = 0
  while i < directors_database.length do
    # Find hash with matching name values
    if directors_database[i][:name] == director_data[:name]
      # Assign the hash for this director's movie data to the obj director_movies
      director_movies = directors_database[i][:movies]
    end
    i += 1
  end
  
  # Iterate over director_movies and add the value of each :worldwide_gross to director_gross
  j = 0
  while j < director_movies.length do
    director_gross += director_movies[j][:worldwide_gross]
    j += 1
  end
  puts director_gross
  return director_gross
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }

def directors_totals(nds)

  result = {}
  
  # Iterate over the nds object and add the value of name at each index as a key in the result object
  # And set its value to the output of the gross_for_director() function with the nested object at this index as its argument
  i = 0
  while i < nds.length do
    result[nds[i][:name]] = gross_for_director(nds[i])
    i += 1
  end
  result
end
