json.extract! booking, :id, :date_time, :table_id, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
