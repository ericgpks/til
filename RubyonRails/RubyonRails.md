## アクティブレコード
データの取得・保存処理とドメインロジックを合わせてカプセル化するアーキテクチャーパターン。
データベースのテーブルをクラス、レコードをクラスのインスタンス、カラムをインスタンスの属性に対応させる。
アクティブレコードを実装したクラスでは、SQLの実行結果からクラスのインスタンスを構築し、インスタンスメソッドを介して特定のレコードを操作する。

## 値オブジェクト
値が同じであればアプリケーション上は同じものとして扱って良いオブジェクトのこと。  
Railsにはモデルの属性を値オブジェクトとして表現するための仕組みが用意されている。

```ruby
class User < ApplicationRecord
  composed_of :phone_number, mapping: %w[phone_number value]
end
```
第一引数にはモデルの属性名、第二引数には値オブジェクトの属性名を指定する。

## サービスオブジェクト
複数のオブジェクトを組み合わせて表現するロジックのように不自然なドメインロジックを独立したオブジェクトとして定義したもの。
サービスオブジェクトはモデルとは異なり、自身の動作を変更するような状態を持たない。  
モデルに実装すべきロジックまで実装しないようにする。  
対応するイベントがを見落としていないかを確認する。

- サービスオブジェクトを実装するクラスの名前は、ある1つのドメインロジックを指すものにすると良い。
- ロジックを実行するためのクラスメソッドを1つだけ公開するようにする。
- クラスの外からはインスタンスを生成できないようにすることで、サービスオブジェクトに状態を持たせないようにできる。

## ActiveModel
ActiveModel はモデルに関するモジュール軍を提供するライブラリであり、ActiveRecordの実装に利用されている。  
ActiveModelを利用することで、自分で定義した素のRubyクラスにもActiceRecordと同等のインターフェースや機能を追加できる。

### ActiceModel::Attributes
型を持つ属性の定義を容易にしてくれる。
```ruby
class Person
  include ActiveModel::Attributes
    
  attribute :name, :string
  attribute :age, :integer
end
```
attribute メソッドは第1引数で属性名を、第2引数で型名を指定する。

### ActiveModel::Callbacks
コールバックの実装を容易にしてくれるモジュール。
```ruby
class Person
  extend ActiveModel::Callbacks

  attr_accessor :created_at, :updated_at

  define_model_callbacks :test

  before_test :record_timestamps

  def test
    run_callbacks :test do
      true
    end
  end

  private

  def record_timestamps
    current_time = Time.current
    
    self.created_at ||= current_time
    self.updated_at = current_time
  end
end
```

### ActiveModel::Serialization
オブジェクトのシリアライズ機能の実装を容易にしてくれるモジュール。
```ruby
class Person
  include ActiveModel::Serialization

  attr_accessor :name, :age

  def attributes
    { name: name, age: age }
  end
  
  def to_xml(options = nil)
    serializable_hash(options).to_xml(camelize: :lower, root: self.class.name)
  end
end
```

### ActiveModel::Validations
属性のバリデーションを容易にしてくれるモジュール。
```ruby
class Person
  include ActiveModel::Validations

  attr_accessor :name, :age

  validates :name, presence: true, length: { maximum: 100 }
  validates_numericality_of :age, greater_than_or_equal_to: 0
end
```

### ActiveModel::Model
ActiveModelが提供するモジュール群の一部をまとめたモジュール。
```ruby
class Person
  include ActiveModel::Model

  attr_accessor :name, :age

  validate :name, presence: true, length: { maximum: 100 }
  validates_numericality_of :age, greater_than_or_equal_to: 0
end
```

### ActionView CaptureHelper
`provide` ヘルパーメソッドは、Rails のビュー（View）で使用されるメソッドの一つです。このヘルパーメソッドを使用すると、コントローラから渡された変数やデータをビュー内で利用することができます。

例えば、以下のようなコードを考えてみましょう。
```ruby
# コントローラ
def show
  @user = User.find(params[:id])
  provide(:title, @user.name)
end
```
```rubyonrails
<h1><%= yield(:title) %></h1>
```
上記の例では、コントローラで `provide(:title, @user.name)` という記述がされています。これによって、ビュー内で `yield(:title)` を使ってコントローラから渡された @user.name の値を表示することができます。
`provide` ヘルパーメソッドは親のレイアウトテンプレートと連携して、ビュー内で値を共有するために使用されることが多いです。

公式ドキュメントの URL は以下になります：
https://api.rubyonrails.org/classes/ActionView/Helpers/CaptureHelper.html#method-i-provide

### ActiveRecord::Associations::CollectionProxy
https://api.rubyonrails.org/v7.1.3/classes/ActiveRecord/Associations/CollectionProxy.html

1つのオブジェクトからassociationをもつ複数のオブジェクトに対して実行できるメソッドが定義されている

### ActiveRecord::FinderMethods
https://api.rubyonrails.org/v7.1.3/classes/ActiveRecord/FinderMethods.html

1つのオブジェクトに対して実行できるメソッドが定義されている

CollectionProxy にあるメソッドは super で FinderMethods にあるメソッドの実装を呼んでいそうだが、どうして CollectionProxy から FinderMethods が呼べるのだろうか
