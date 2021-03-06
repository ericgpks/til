### Template Methodとは
テンプレートの機能を持つパターン  
スーパークラスにテンプレートとなるメソッドが定義されている  
↑  
メソッドの定義の中では抽象メソッドが使われている  
↑  
抽象メソッドを実際に実装するのはサブクラス  

上記のようにスーパークラスで処理の枠組みを定め、サブクラスでその具体的内容を定めるデザインパターンを *Template Method パターン* と呼ぶ

### Template Methodパターンの登場人物

#### AbstractClass(抽象クラス)の役
テンプレートメソッドを実装する  
こういうの↓
 ```
 public final void display() {
        open();
        for (int i = 0; i < 5; i++) {
            print();
        }
        close();
    }
 ```
テンプレートメソッドで使っている抽象メソッドを宣言する  
こういうの↓
 ```
 public abstract void open(); 
 ```
抽象メソッドはサブクラスである ConcreteClass によって実装される

#### ConcreteClass(具象クラス)の役
AbstractClass役で定義されている抽象メソッドを具体的に実装する  
ここで実装したメソッドはテンプレートメソッドから呼び出される

### ポイント
テンプレートメソッドでアルゴリズムが書かれているので、各ConcreteClassでアルゴリズムを書かなくて良くなる

スーパークラス型の変数にサブクラスのインスタンスのどれを代入しても正しく動作する  
この原則はLSP(The Liskov Substitution Principle)と呼ばれる

どの処理をスーパークラスにおき、どの処理をサブクラスにおくかについては、プログラムの設計を行う人に任されている

