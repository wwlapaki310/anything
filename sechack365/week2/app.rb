require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'json'
require 'uri'
require 'net/http'

url = URI("https://australiaeast.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["ocp-apim-subscription-key"] = ENV['AZURE_SUBSCRIPTION_TEXT_ANALYSIS']

get '/:name' do
  uri = "https://twitter.com/@#{params['name']}"
  doc = Nokogiri::HTML(open(uri),nil,"utf-8")

  @nano = []

  doc.css(".js-tweet-text-container").each do |tweet_text|
    tweet_raw = tweet_text.text.gsub("\n","").strip
    tweet = tweet_raw.gsub(/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/, "")
    request.body = "{'documents':[{'language':'ja','id':'1','text': '#{tweet}'}]}".gsub("\'","\"")
    response = http.request(request)
    nanote = JSON.load(response.body)
    @nano.push("#{tweet} , #{nanote["documents"].first["score"]}")
  end

  erb :index
end
