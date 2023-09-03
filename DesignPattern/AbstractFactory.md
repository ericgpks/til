## Abstract Factoryパターン

Main.java  
┗factory  
　　┗Factory.java  
　　┗Item.java  
　　┗Link.java  
　　┗Tray.java  
┗listfactory  
　　┗ListFactory.java  
　　┗ListLink.java  
　　┗ListTray.java  
　　┗ListPage.java  

### 抽象的な部品：Itemクラス
LinkクラスとTrayクラスのスーパークラス  
LinkとTrayを同一視するためのクラス

### 抽象的な部品：Linkクラス
HTMLのハイパーリンクを抽象的に表現したクラス  

### 抽象的な部品：Trayクラス
複数のLinkやTrayを集めてひとまとまりにしたものを表すクラス

### 抽象的な製品：Pageクラス
抽象的な製品

### 抽象的な工場：Factoryクラス
クラス名を指定して具体的な工場のインスタンスを作成するもの

### 具体的な工場：ListFactoryクラス
Factoryクラスの抽象メソッド createLink, createTray, createPage を実装している

### 具体的な部品：ListLinkクラス
Linkクラスのサブクラス。makeHTML() の具体的な処理（liタグやaタグ）を実装している

### 具体的な部品：ListTrayクラス
Trayクラスのサブクラス。アイテムはItemクラスに格納され、Itemの makeHTML() を呼び出してHTML化する。

### 具体的な製品；ListPageクラス
Pageクラスのサブクラス。