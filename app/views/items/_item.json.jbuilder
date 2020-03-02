json.extract! item, :id, :name, :code, :comment, :type, :user_id, :image, :created_at, :updated_at
json.url item_url(item, format: :json)
