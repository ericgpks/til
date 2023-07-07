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

=> -90
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
