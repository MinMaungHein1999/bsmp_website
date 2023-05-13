json.extract! book_author, :id, :book_id, :author_id, :created_at, :updated_at
json.url book_author_url(book_author, format: :json)
