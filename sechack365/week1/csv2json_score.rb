require 'csv'
require 'pry'
csv_data = CSV.read('nanophate_twitter_with_score.csv', headers: true)

File.open("sentiment_result.json", 'a+') do |f|
  f.write('{"documents": [')

  CSV.foreach('nanophate_twitter_with_score.csv', headers: true).with_index(1) do |data, count|
    msg = "{'language': 'ja', 'datetime' : '#{data['datetime']}','id': '#{count}', 'text': '#{data['tweet'].gsub("\n", "")}', 'score' : '#{data['score']}'},"
    f.write(msg.gsub("\'", "\""))
  end

  f.write("]}")
end
