## 世界一わかりやすい Clean Architecture

### 資料
https://www.nuits.jp/entry/easiest-clean-architecture-2019-09
https://github.com/nuitsjp/Easiest-Clean-Architecture

### Clean Architecture
・依存性は、より上位レベルの方針にのみ向ける
・制御の流れと依存方向は分離しコントロールする
・

### 柔軟性と安定性の配分
依存関係による安定度と柔軟性のトレードオフ
依存する側は依存される側より安定性が低くなる
依存する側は依存される側より柔軟性が高くなる
本質的な価値は依存される側に定義するべき
本質的な価値は、アプリケーション開発の本来の目的の部分

制御の流れはクライアントからサーバーサイドだが
依存方向はクライアント→コントラクト、コントラクト←サーバー

### Software Architectureとは
システムを大きなレベルで分解したもので、決定事項の変更は困難。
重要な要素はすべてアーキテクチャー
どう分割し、どう結合するかが大事


## UnoPlatform
UWPのXAMLでクロスプラットフォームで開発ができる