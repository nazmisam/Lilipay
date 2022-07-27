class Escrow < ApplicationRecord
    has_one_attached :invoice
    has_one_attached :receipt
    has_one_attached :proof

    enum roles: [:seller, :buyer], _suffix: true
    enum vendor_roles: [:seller, :buyer], _prefix: :roles
    enum status: [ :pending, :approved, :ship, :paid, :received]
end
