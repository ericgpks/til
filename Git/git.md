## rails new で作成したディレクトリをトップディレクトリとしてpushする方法
gem install rails -v 6.0.3  
rails new test  
cd test  
git init  
git add -A  
git commit -m "initial commit"  
git branch -M main  
git remote add origin git@github.com: "username"/"repositoryname".git  
git push -u origin main  

## git branch
#### git branch -M name
カレントブランチの名前をnameに変更する

## git add
#### git add -A 
すべての変更（追加・変更・削除）を反映させる
#### git add . 
カレントディレクトリ内のすべての変更（追加・変更・削除）を反映させる
#### git add -p
ファイルごとに、変更内容を見ながら変更内容をステージに反映させるかどうかを選択することができるようになる  
反映させる場合は `y` 、させない場合は `n`   
さらに、同じファイル内で複数の変更があった場合に、一部だけ反映するということもできるようになる  

## git push
#### git push -u

## git blame
#### --ignore-revs-file
指定したファイルに記載されているコミットをblameにおいて無視する  
https://github.blog/changelog/2022-03-24-ignore-commits-in-the-blame-view-beta/
https://docs.github.com/en/repositories/working-with-files/using-files/viewing-a-file#ignore-commits-in-the-blame-view

例
```.git-blame-ignore-revs
# .git-blame-ignore-revs
# Removed semi-colons from the entire codebase
a8940f7fbddf7fad9d7d50014d4e8d46baf30592
# Converted all JavaScript to TypeScript
69d029cec8337c616552756310748c4a507bd75a
```