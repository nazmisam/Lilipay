class Escrow < ApplicationRecord
    has_one_attached :invoice
end
