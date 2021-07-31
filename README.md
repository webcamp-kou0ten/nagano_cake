## 長野ケーキ--ECサイト--
管理者画面、顧客管理画面の両面を用意しており、ECサイトを運営するのに適した構造となっています。

## Overview
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト。
Instagramからの顧客流入により管理が煩雑化。それを解消することを目的とする。

## Demo
![Animation-1](https://user-images.githubusercontent.com/83518855/127267784-4657410f-a30c-412f-99eb-7d571b1c46a7.gif)

## Requirement

ruby 2.6.3
Rails 5.2.6

## Gem(デフォルト、デバック、テストを除く)
device
refile
refile-mini-magick
bootstrap
jquery
font-awesome-sass
kaminari
autonumeric-rails
※詳細はGemfile

## Usage
下記コマンドを実行することで使用できます。
* $ bundle install
* $ rails db:migrate
* $ rails db:seed

## 管理者ログイン
path: /admins/sign_in
email: test@gmail.com
password: hogehoge

## ER図
![ER図](https://user-images.githubusercontent.com/83518855/126987080-da1274ef-0655-4e0a-805b-da8f997633ea.png)

## Production
紅0点
