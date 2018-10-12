require 'json'
require 'pry'
File.open("azure_sentiment.json") do |file|
  json = JSON.load(file)
  json["documents"].each do |entity|
    puts entity["score"]
  end
end
