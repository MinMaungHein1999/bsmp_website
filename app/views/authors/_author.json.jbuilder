json.extract! author, :id, :name, :email, :phone, :address, :created_at, :updated_at
json.url author_url(author, format: :json)
