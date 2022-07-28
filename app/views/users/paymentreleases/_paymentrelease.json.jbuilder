json.extract! paymentrelease, :id, :name, :contact_number, :amount, :description, :address, :postal_code, :city, :state, :country, :transaction_number, :escrow_id, :created_at, :updated_at
json.url paymentrelease_url(paymentrelease, format: :json)
