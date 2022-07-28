json.extract! escrow, :id, :role, :payment_for, :payment_amount, :transaction_fees, :created_at, :updated_at
json.url escrow_url(escrow, format: :json)
