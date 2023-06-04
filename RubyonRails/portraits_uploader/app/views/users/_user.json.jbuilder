json.extract! user, :id, :name, :portrait, :created_at, :updated_at
json.url user_url(user, format: :json)
json.portrait url_for(user.portrait)
