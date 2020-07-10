class Guest < ApplicationRecord
    has_many :reservations
    has_many :houses, through: :reservations

    validates :first_name, :last_name, :phone_number, :email_address, :address, presence: true
    validates :phone_number, :email_address, :address, uniqueness: true

    def to_s
        "#{self.first_name} #{self.last_name}"
    end
end
