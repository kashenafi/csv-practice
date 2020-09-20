require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  all_olympians = [] #will hold hashes I make

  CSV.read(filename, headers: true).each do |record| #each row hold a record
    athlete = {
        "ID" => record["ID"],
        "Name" => record["Name"],
        "Height" => record["Height"],
        "Team" => record["Team"],
        "Year" => record["Year"],
        "City" => record["City"],
        "Sport" => record["Sport"],
        "Event" => record["Event"],
        "Medal" => record["Medal"]
    }
    all_olympians << athlete
  end

  return all_olympians
end

def total_medals_per_team(olympic_data)
  total_medals_count = {}

  olympic_data.each do |medalist|
    if medalist["Medal"] != "NA"
      if total_medals_count[medalist["Team"]].nil?
        total_medals_count[medalist["Team"]] = 1
      else
        total_medals_count[medalist["Team"]] += 1
      end
    end
  end

  return total_medals_count
end

def get_all_gold_medalists(olympic_data)  #Thank you, Simon! Broke down to understand
  return olympic_data.filter { |olympian| olympian["Medal"] == "Gold" }
end
