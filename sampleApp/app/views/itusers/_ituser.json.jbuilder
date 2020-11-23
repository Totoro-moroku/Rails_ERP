json.extract! ituser, :id, :name, :email, :password, :birthday, :created_at, :updated_at
json.url ituser_url(ituser, format: :json)
