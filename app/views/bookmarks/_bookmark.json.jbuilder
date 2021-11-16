json.extract! bookmark, :id, :dish_id, :venue_id, :user_id, :notes, :image, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
