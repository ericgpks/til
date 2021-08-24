## Prototypeパターン
クラス名を指定せずにインスタンスを生成したくなる場合がある  
クラスからインスタンスを生成するのではなく、インスタンスからインスタンスをコピーして新しいインスタンスを作るパターン

### Productインタフェース
複製を可能にするためのもの  
Cloneable インタフェースを実装しているクラスのインスタンスはcloneメソッドをつかって自動的に複製を行うことができるようになる

useメソッドは使うためのもので何を意味するかはサブクラスの実装にまかされている

createClone メソッドはインスタンスの複製を行うためのもの

### Managerクラス
Productインタフェースを利用してインスタンスの複製を行うクラス  
実際のクラスはわからないが、とにかくProductインタフェースを実装したクラスのインスタンス

具体的な個々のクラスの名前を書かず、インタフェース名だけを使って、他のクラスの架け橋になっている

### MessageBoxクラス
Productインタフェースを実装している

#### Prototypeの役
インスタンスをコピーして新しいインスタンスを作るためのメソッドを定める

#### ConcretePrototypeの役
インスタンスをコピーして新しいインスタンスを作るメソッドを実際に実装する

#### Clientの役
インスタンスをコピーするメソッドを利用して新しいインスタンスを作る

#### cloneメソッド
clone メソッドによって行われるのはフィールドの内容をそのままコピーする  
フィールドの先にあるインスタンスの中身までは考慮しない