json.extract! transaction, :id, :type_id, :name, :date, :entity_id, :user_id, :memo, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
