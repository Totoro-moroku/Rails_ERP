json.extract! transaction_item, :id, :transaction_id, :item_id, :quantity, :rate, :amount, :line, :created_at, :updated_at
json.url transaction_item_url(transaction_item, format: :json)
