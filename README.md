# MacroRecipe

MacroRecipeはマクロ栄養素の量がわかるレシピサイトです。<br>
[文部科学省／日本食品標準成分表2020年版（八訂）](https://www.mext.go.jp/a_menu/syokuhinseibun/mext_01110.html)を食材データとしてインポートし、レシピ作成時に料理に含まれる栄養素量を自動計算します。<br>
「高タンパク質・低脂質な料理を食べたいが茹でただけの鶏胸肉は飽きたッ！」というトレーニーにおすすめです。

##  URL
https://macrorecipe.herokuapp.com/

テスト用アカウント<br>
メールアドレス：macro@recipe.com<br>
パスワード：macrorecipe

# 使用技術
* Ruby 3.0.0
* Ruby on Rails 6.1.3
*  MySQL 5.7
* Nginx
* Puma
* Docker/Docker-compose
* Bootstrap
* jQuery

# 機能
* ユーザー登録、ログイン機能
* 投稿機能
	* 画像投稿（carrierwave、cloudinary）
	* 入力フォームの増減（cocoon)
	* 検索機能つきセレクトボックス（select2)
* いいね機能
* ページネーション（pagy）
* 検索機能
	* 栄養素量での絞り込み