「ユーザー情報」
## Tabel名
・usersテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null: false|ニックネーム
|email             |string |null: false|メールアドレス
|encrypted_password|string |null: false|パスワード
|sexual            |string |           |性別
|profile           |text   |           |プロフィール
has_one_attached :image プロフィール画像

### Association
has_one_attached :image
has_many:worries
has_many:comments
has_many:loves
has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy




「悩み情報」
## Tabel名
・worriesテーブル
|Column             |Type   |Options    |
|-------------------|-------|-----------|
|title              |string |null: false|タイトル
|problem            |text   |null: false|悩み
|status             |integer|null: false|, default: 0「悩み投稿」「日記投稿」
|situation          |integer|null: false|, default: 0「公開」「コメントなし公開」「非公開」「下書き保存」
|user               |references|null: false|foreign_key: true|外部キーuser 悩み投稿者のid
### Association
belongs_to:user
has_many:comments
has_many:loves



「コメント情報」
## Tabel名
・commentsテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|answer            |text   |null: false|コメント
|user              |references|null: false|foreign_key: true|外部キーuser コメント投稿者のid
|worry             |references|null: false|foreign_key: true|外部キーworry 悩み情報のid

### Association
belongs_to:user
belongs_to:worry
has_many:like




「悩みにいいね情報」
## Tabel名
・lovesテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|user              |references|null: false|foreign_key: true|外部キーuser いいねするユーザーのid
|worry             |references|null: false|foreign_key: true|外部キーworry 悩み情報のid

### Association
belongs_to:user
belongs_to:worry




「コメントにいいね情報」
## Tabel名
・likesテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|user              |references|null: false|foreign_key: true|外部キーuser いいねするユーザーのid
|comment           |references|null: false|foreign_key: true|外部キーcomment コメント情報のid

### Association
belongs_to:user
belongs_to:comment




「フォロー情報」
## Tabel名
・relationshipsテーブル
|Column            |Type   |Options    |
|------------------|-------|-----------|
|follower          |references|null: false|foreign_key: true| { to_table: :users } フォローする
|followed          |references|null: false|foreign_key: true| { to_table: :users } フォローされる

### Association
belongs_to :follower, class_name: "User"
belongs_to :followed, class_name: "User"