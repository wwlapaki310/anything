require 'json'
require 'pry'
File.open("sentiment_result.json") do |file|
  json = JSON.load(file)

  datetime = []
  json["documents"].each do |e|
    datetime.push(e["datetime"])
  end

  uniq_date = datetime.uniq

  uniq_date.each do |date|
    on_date_element = json["documents"].select {|element| element["datetime"] == date }
    on_date_score = on_date_element.map{ |e| e["score"].to_f }.sum / on_date_element.count
    puts "#{date}, #{on_date_score}" # もう時間がないのでコピペで excel へwwww😭
  end
end
