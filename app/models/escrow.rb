class Escrow < ApplicationRecord
    has_one_attached :invoice
    has_one_attached :receipt
    has_one_attached :proof
    belongs_to :user
    has_many :payments, dependent: :destroy
    has_many :paymentreleases, dependent: :destroy
    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy

    enum roles: [:seller, :buyer]
    enum status: [ :pending, :approved, :paid, :processing, :received, :refund_requested, :refunded, :successful, :rejected, :payment_pending]
    before_validation :generate_order_number, on: :show
    after_create_commit :notify_recipient
    before_destroy :cleanup_notifications
    

    def generate_transaction_number
        begin
          self.transaction_number = 5.times.map { [*0..9].sample }.join.to_i
        end while self.class.find_by(transaction_number: transaction_number)
    end
    
    def generate_checksum
        data = "#{buyer_email}|#{buyer_name}|#{shipping_attention}|#{""}|#{transaction_number}|#{description}|https://#{ENV["domain"]}/users/escrows/paymentredirect|#{total_pay}|#{"02b66d73-c60f-47e6-a07c-0aa3609ddddd"}"
        puts(data)
        checksum_token = "a69b33918639440dbc7adc2f0fea60f67d7d675d3a2876f061832eecd4c04592"
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
    end

    def notify_recipient
        notification = EscrowNotification.with(escrow: self)
        recipient = User.find_by(email: vendor_email)
        notification.deliver(recipient)
    end
    
    def cleanup_notifications
        notifications_as_escrow.destroy_all
    end
end
