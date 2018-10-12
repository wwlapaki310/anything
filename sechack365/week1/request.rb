require 'uri'
require 'net/http'

url = URI("https://australiaeast.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["ocp-apim-subscription-key"] = ENV['AZURE_SUBSCRIPTION_TEXT_ANALYSIS']
request.body = File.read(formatter.json)
response = http.request(request)
puts response.read_body


二軸ではんだんできる
文脈が否定て　フレーズではわからん

すれ違いの
選ぶ語彙の個人差




文脈が
個人差がアゥタリ比較があると

相手は誤解アラート

言葉のつk伊方

個人分析した上で
  - 違う文脈アラート


ポップぱ


差の大きさ
ぶんみゃくを　みないと


絵文字に


line 