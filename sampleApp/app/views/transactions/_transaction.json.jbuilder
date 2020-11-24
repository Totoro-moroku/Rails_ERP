json.extract! transaction, :id, :type_id, :name, :date, :entity_id, :user_id, :memo, :mainline, :item_id, :quantity, :rate, :amount, :line, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
