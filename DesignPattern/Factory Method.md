### Factory Method
Template Method パターンでは、スーパークラス側で処理の骨組みを作り、サブクラス側で具体的な処理の肉付けを行った  
このパターンを **インスタンス生成** の場面に適用したものが *Factory Methodパターン*

インスタンスの作り方をスーパークラス側で定めるが、具体的なクラス名は定めない

### Productクラス
framework パッケージに属する  
抽象メソッド `use` のみが宣言されていて、具体的な実装は全てサブクラスにまかせている

このフレームワークでは、製品とは「何はともあれ、use できるもの」と規定している

### Factoryクラス
framework パッケージに属する  
ここで Template Method パターンが使われている

このフレームワークでは、工場とは「create メソッドで Product のインスタンスを生成するもの」と規定している  
そして、 create メソッドは「 createProduct で製品を作って、 registerProduct で登録する」という手順を決めて実装されている

### IDCardクラス
フレームワークから分離された idcard パッケージに属する  
IDCard クラスは、製品 Product クラスのサブクラスとして定義されている

### IDCardFactoryクラス
createProduct と registerProduct のメソッドを実装している  
createProduct では、IDCard のインスタンスを生成することで「製品を作る」ことを実現している  
registerProduct では、IDCard の owner を owners フィールドに追加して「登録」という機能を実現している

### Product の役
フレームワーク側。インスタンスが持つべきインタフェースを定める抽象クラス。  
具体的な内容はサブクラスの ConcreteProduct 役が定める。

### Creator の役
フレームワーク側。Product 役を生成する抽象クラス。  
具体的な内容はサブクラスの ConcreteProduct 役が定める。

Creator 役は実際に生成する ConcreteProduct 役については何も知らない。知っているのは Product 役とインスタンス生成のメソッドを呼び出せば、Product が生成されるということだけ。  
**new による実際のインスタンス生成を、インスタンス生成のためのメソッド呼び出しに代えることで、具体的なクラス名による束縛からスーパークラスを解放している**