require 'json'
require 'pry'
File.open("sentiment_result.json") do |file|
  binding.pry
  json = JSON.load(file)

  json["documents"].each do |f|
    binding.pry

  end
end
