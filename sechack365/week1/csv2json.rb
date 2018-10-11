require 'csv'
require 'pry'
csv_data = CSV.read('nanophate_twitter.csv', headers: true)

File.open("sentiment_format.json", 'a+') do |f|
  f.write('{"documents": [')

  CSV.foreach('nanophate_twitter.csv', headers: true).with_index(1) do |data, count|
    msg = "{'language': 'ja', 'id': '#{count}', 'text': '#{data['tweet'].gsub("\n", "")}'},"
    f.write(msg.gsub("\'", "\""))
  end

  f.write("]}")
end
