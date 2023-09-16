### 2章
- オブジェクトのメソッドはオブジェクトのクラスに住んでいる（クラスから見ればそれはインスタンスメソッドと呼ばれる）
- refinements
  - https://docs.ruby-lang.org/ja/latest/method/Module/i/refine.html
  - https://magazine.rubyist.net/articles/0041/0041-200Special-refinement.html
  - クラスを拡張するときに使う
  - 例えばStringクラスを拡張したいときに
  - ```ruby
    module StringExtensions
      refine String do
        def reverse
          "esrever"
        end
      end
    end
    ```
    - とするとStringクラスにreverseメソッドが追加される
    - ただし、この拡張はStringExtensionsモジュールをincludeしているクラスのみで有効になる
    - 使い方
    - ```ruby
      class StringExtensionsTest
        using StringExtensions
        def self.test
          p "my_string".reverse
        end
      end
      ```
      - このようにusingを使うとStringExtensionsモジュールの拡張が有効になる
      - このようにして拡張を有効にすることをrefineするという
      - この拡張はStringExtensionsTestクラスのみで有効になる
      - つまり、StringExtensionsTestクラスの外では"my_string".reverseは使えない
      - これはrefineのスコープがクラス単位だから
      - 
