## トランザクションの特殊な使い方
トランザクションの中で全ての登録処理を試行して、失敗するもののエラーメッセージを全て取得したい場合のやり方

### A  
エラーを取得して、エラーがあったらロールバックする方法
```ruby
def attempt_all_saves
  errors = []
  
  ActiveRecord::Base.transaction do
    begin
      user.save
      errors << user.errors.full_messages unless user.errors.empty?
      
      post.save
      errors << post.errors.full_messages unless post.errors.empty?
      
      comment.save
      errors << comment.errors.full_messages unless comment.errors.empty?
      
      # エラーが1つでもあればロールバック
      raise ActiveRecord::Rollback if errors.any?
    rescue => e
      # 予期せぬエラーが発生した場合
      errors << e.message
      raise ActiveRecord::Rollback
    end
  end
  
  # トランザクションの結果を返す
  return { success: errors.empty?, errors: errors.flatten }
end
```
### B  
先にバリデーションで検証して問題がなかったら登録処理に進む方法
```ruby
def validate_and_save_all
  valid = user.valid? & post.valid? & comment.valid?
  
  if valid
    ActiveRecord::Base.transaction do
      user.save!
      post.save!
      comment.save!
    end
    return { success: true, errors: [] }
  else
    errors = []
    errors << user.errors.full_messages unless user.errors.empty?
    errors << post.errors.full_messages unless post.errors.empty?
    errors << comment.errors.full_messages unless comment.errors.empty?
    return { success: false, errors: errors.flatten }
  end
end
```

Aの方が直感的でありつつ、Bの方が検証を通らなければDBに登録処理をしにいかないので、ロックを取りすぎなくて良いかもしれない
