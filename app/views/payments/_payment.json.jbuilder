json.extract! payment, :id, :name, :contact_number, :amount, :description, :address, :postal_code, :city, :state, :country, :transaction_number, :escrows_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
