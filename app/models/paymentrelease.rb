class Paymentrelease < ApplicationRecord
  belongs_to :escrow
  enum status: [:released, :refunded]
end
