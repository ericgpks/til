## クラスメソッドとインスタンスメソッド
`String.new`のようにクラスが直接呼び出すメソッドをクラスメソッドと呼び、それに対して、`"foobar".length`のようにインスタンスが呼び出すメソッドをインスタンスメソッドと呼びます。

## hash
case 文で書けそうなもの(特定の値を返す場合)を hash で書いて判定させることができる。
hash に key を与えると value が返ってくるため。

## symbol
文字列を symbol に変換したいときは `to_sym` で変換できる。
symbolは識別子（ID）である。

## yield
```ruby
def output 
  yield * 10
end
```
```ruby
x = 1
output { x - 10 }
# => -90
```
yieldには渡されたブロックが突っ込まれている

## アロー演算子
```ruby
lookup -> (artists) do
  artists.select do |artist|
    album_artists[artist]
  end
end
```
これが無名関数の定義の仕方

```ruby
artists = %w["a" "b" "c"]
lookup[artists]
```
無名関数を使う時はこのように使う

## イテレーター
```ruby
10.times.flat_map do |i|
  p i
end
```
timesのブロックパラメーターには0からself-1の値が渡される  
flat_mapはブロックに渡した要素を連結して配列にして返す  
なので上記は
```ruby
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
が返る

## Integer#upto
```ruby
3.upto(10) do |i|
  p i
end
```
1から10まで1ずつ増やしながら繰り返していく
```ruby
3
4
5
6
7
8
9
10
```

## Integer#abs
絶対値を返す
```ruby
-10.abs # => 10
```

## String#to_d
文字列をBigDecimalに変換する
```ruby
require 'bigdecimal/util'

"0.1".to_d # => 0.1
```

## Object#respond_to?
オブジェクトが指定したメソッドを持っているかどうかを調べる
```ruby
10.respond_to?(:abs) # => true
```

## Object#send
オブジェクトのメソッド名を引数にしてメソッドを呼び出し実行結果を返す
```ruby
-10.send(:abs) # => 10
```

## BasicObject#instance_exec
与えられたブロックをレシーバーのコンテキストで実行する
```ruby
class KlassWithSecret
  def initialize
    @secret = 99
  end
end
k = KlassWithSecret.new
k.instance_exec(5) {|x| @secret+x }   #=> 104
```

## Proc
関数をオブジェクトとして表現したもの。Proc.newにブロックを渡すことで生成できる。
```ruby
greeter = Proc.new { |name|
  puts "Hello, #{name}!"
}
```
Proc#call を呼び出すと手続きが実行される。
```ruby
greeter.call 'Ruby'
#=> Hello, Ruby!
```
call に渡した引数はブロックの仮引数に代入される。

このような短縮した書き方も可能。
```ruby
by_proc = proc { |name| puts "Hello, #{name}!" }
by_proc.call 'Ruby'

by_lambda = lambda { |name| puts "Hello, #{name}!" }
by_lambda.call 'Ruby'
```

## Hash#merge
selfとothersのハッシュの内容を順番にマージ(統合)した結果を返します。
self と others に同じキーがあった場合はブロック付きか否かで判定方法が違います。ブロック付きのときはブロックを呼び出してその返す値を重複キーに対応する値にします。ブロック付きでない場合は常に others の値を使います。
```ruby
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 246, "c" => 300 }
h1.merge          #=> {"a"=>100, "b"=>200}
h1.merge(h2)      #=> {"a"=>100, "b"=>246, "c"=>300}
h1.merge(h2) {|key, oldval, newval| newval - oldval}
#=> {"a"=>100, "b"=>46, "c"=>300}
```
## 特異メソッド（クラスメソッド）
```ruby
class C
  def a_method
    'C#a_method()'
  end
  def self.a_class_method
    'C.a_class_method()'
  end
end
class D < C
end

obj = D.new
#=> #<D:0x000000010ee1ece0> 
obj.a_mathod
#=> "C#a_method()"
D.a_class_method
#=> "C.a_class_method()"
```
上記の例のように継承元のクラスメソッドも呼び出せる。

## Gemfile
Gemfile の中で条件分岐を使うことができる。  
例えば特定のRubyのバージョンでしか動作しない gem を使いたい場合などに使える。
```Gemfile
if RUBY_VERSION >= '3.0'
  gem 'steep', require: false
  gem 'typeprof'
end
```
or
```Gemfile
gem 'steep', require: false if RUBY_VERSION >= '3.0'
gem 'typeprof' if RUBY_VERSION >= '3.0'
```

