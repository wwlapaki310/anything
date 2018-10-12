# TextAnalyticsAPIを使って自分のツイートデータを分析してみた

## 背景

コミュニケーションのすれ違いで他人から除外された気持ちになったことがあります。
文章の解釈は人それぞれ、契約書や公的な文書裁判所などが解釈を法律と照らし合わせて判断ができます。
でも現状のネットではそのようなことは言えないしそこまでコストはかけることができません。

裁判所のように数値的に言ったことを評価することですくなくとも平均値的な解釈ができると思いました。

## やったこと

以下のリンクにここで収集した情報をまとめました。
https://docs.google.com/spreadsheets/d/14iQSvBjHQFjxMM0UkBfCB4xWwYcxdbNrxNxWlHWHY1k/edit?usp=sharing

## やってみてわかったこと

[Microsoft API : TextAnalyticsAPI ](https://docs.microsoft.com/ja-jp/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis#preparation) を使ったところコミュニティーに依存した発言の違いがあると感じました。次の画像にあるような文字[「ぴょんぴょん」](https://dic.nicovideo.jp/a/あぁ%5E〜心がぴょんぴょんするんじゃぁ%5E〜) を適切な感情値にすることはできませんでした。一般からの解釈だけでは情報の差が起きると思われます。

![readme-tweet-data](https://user-images.githubusercontent.com/6015450/46852229-3609ca80-ce35-11e8-83ac-4559d5655f0d.png)


## [WIP] 使い方

時間がある時にどのようにして、Google Spread シートに出力したのかを共有したいと思います。

## API・概要
https://docs.microsoft.com/ja-jp/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis#preparation


# ライセンス
MIT
ツイートは個人の見解です、自由に使っても良いですが、利用については関与しません。
