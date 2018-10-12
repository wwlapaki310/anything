require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'json'
require 'uri'
require 'net/http'
require 'haml'

url = URI("https://australiaeast.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["ocp-apim-subscription-key"] = ENV['AZURE_SUBSCRIPTION_TEXT_ANALYSIS']

get '/' do
  haml :index
end

post '/user' do

  @username = params['name']
  uri = "https://twitter.com/@#{params['name']}"
  doc = Nokogiri::HTML(open(uri),nil,"utf-8")

  @users_tweet = []

  doc.css(".content").each do |tweet_text|
    tweet_raw = tweet_text.css('.js-tweet-text-container').text.gsub("\n","").strip
    tweet = tweet_raw.gsub(/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/, "")
    username = tweet_text.css('.FullNameGroup').text.gsub("\n","").strip

    request.body = "{'documents':[{'language':'ja','id':'1','text': '#{tweet}'}]}".gsub("\'","\"")
    response = http.request(request)
    json_body = JSON.load(response.body)

    tweet_attributes = Hash.new { |hash, key| key }

    next if tweet.empty?

    tweet_attributes[:tweet_text] = tweet
    tweet_attributes[:score] = json_body["documents"].first["score"]
    tweet_attributes[:user] = username

    @users_tweet.push(tweet_attributes)
  end

  haml :user
end
