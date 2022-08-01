class Escrow < ApplicationRecord
    has_one_attached :invoice
    has_one_attached :receipt
    has_one_attached :proof
    has_many :payments
    has_many :paymentreleases

    enum roles: [:seller, :buyer], _suffix: true
    enum vendor_roles: [:seller, :buyer], _prefix: :roles
    enum status: [ :pending, :approved, :paid, :processing, :received, :refund_requested, :refunded ]
    before_validation :generate_order_number, on: :show

    def generate_transaction_number
        begin
          self.transaction_number = 5.times.map { [*0..9].sample }.join.to_i
        end while self.class.find_by(transaction_number: transaction_number)
    end
    
    def generate_checksum
        data = "#{buyer_email}|#{buyer_name}|#{shipping_attention}|#{""}|#{transaction_number}|#{description}|http://localhost:3000/users/escrows/paymentredirect|#{total_pay}|#{"02b66d73-c60f-47e6-a07c-0aa3609ddddd"}"
        puts(data)
        checksum_token = "a69b33918639440dbc7adc2f0fea60f67d7d675d3a2876f061832eecd4c04592"
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
    end
end
