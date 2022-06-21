# アプリケーション名
lgbtqplus-sns
  
# アプリケーション概要
性的マイノリティ、LGBTQ+向けの悩みや日記で交流するSNS！  
  
# URL
https://lgbtqplus-sns-eve2525.herokuapp.com/  
  
# テスト用アカウント
・Basic認証ID:admin  
・Basic認証パスワード:2222  
・メールアドレス:a@a  
・パスワード:aaa111  
  
# 利用方法
・トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う  
・トップページ右下の「クイズ投稿ボタン」から、クイズの内容を入力し投稿する  
・一覧ページからクイズのタイトルをクリックして詳細ページに移動する  
・クイズ作成者の場合のみ、「編集」「削除」が行える  
・「クイズに挑むボタン」を押し、クイズの内容が表示される  
・「答えはこちらボタン」を押すと解答と解説が表示される  
  
# アプリケーションを作成した背景
自分自身の学生時代の過去の経験から当時はスマホがなくSNSが普及していなかった事から気軽に悩みの相談ができなかった。  
今の時代にはたくさんのSNSがあるが、専用のSNSなので気兼ねなく相談や日記からの交流が出来たらと考えている。  
  
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1_UHm8OVldspIutMGFGkfsXX-inxdgcqmG6XG7FWuYHs/edit#gid=982722306  
  
# 開発環境
・HTML  
・CSS  
・JavaScript  
・ruby  
・ruby on rails  
  
# 工夫したポイント
見た目をおしゃれにして、ユーザーがワクワクするようなデザインにしたいと思いトップページに動画やJavaScriptを使いました。    
ユーザー登録画面のデザインをこだわりました。  

# これから追加実装したいこと  
・悩みや日記の詳細画面のデザインをする  
・いいね機能が中途半端なため、完璧な形で実装。  
・悩み投稿と日記投稿の表示を分けるようにする
・フォローフォロワー機能の実装。  
・マイページの実装  
・タグづけ機能の実装
・検索機能の実装

# *一部まだ実装できていないテーブル情報もあります
## 「ユーザー情報」Tabel
・usersテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null: false|ニックネーム
|email             |string |null: false|メールアドレス
|encrypted_password|string |null: false|パスワード
|sexual            |string |           |性別
|profile           |text   |           |プロフィール
has_one_attached :image プロフィール画像  

#### Association
has_one_attached :image  
has_many:worries  
has_many:comments  
has_many:loves  
has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy  
has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy  


## 「悩み、日記情報」Tabel
・worriesテーブル
|Column             |Type   |Options    |
|-------------------|-------|-----------|
|title              |string |null: false|タイトル
|problem            |text   |null: false|悩み
|status             |integer|null: false|, default: 0「悩み投稿」「日記投稿」
|situation          |integer|null: false|, default: 0「公開」「コメントなし公開」「非公開」「下書き保存」
|user               |references|null: false|foreign_key: true|外部キーuser 悩み投稿者のid
#### Association
belongs_to:user  
has_many:comments  
has_many:loves  


## 「コメント情報」Tabel
・commentsテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|answer            |text   |null: false|コメント
|user              |references|null: false|foreign_key: true|外部キーuser コメント投稿者のid
|worry             |references|null: false|foreign_key: true|外部キーworry 悩み情報のid

#### Association
belongs_to:user  
belongs_to:worry  
has_many:like  


## 「悩みにいいね情報」Tabel
・lovesテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|user              |references|null: false|foreign_key: true|外部キーuser いいねするユーザーのid
|worry             |references|null: false|foreign_key: true|外部キーworry 悩み情報のid

#### Association
belongs_to:user  
belongs_to:worry  


## 「コメントにいいね情報」Tabel
・likesテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|user              |references|null: false|foreign_key: true|外部キーuser いいねするユーザーのid
|comment           |references|null: false|foreign_key: true|外部キーcomment コメント情報のid

#### Association
belongs_to:user  
belongs_to:comment  


## 「フォロー情報」Tabel
・relationshipsテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|follower          |references|null: false|foreign_key: true| { to_table: :users } フォローする
|followed          |references|null: false|foreign_key: true| { to_table: :users } フォローされる

#### Association
belongs_to :follower, class_name: "User"  
belongs_to :followed, class_name: "User"  