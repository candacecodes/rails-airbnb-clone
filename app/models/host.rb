class Host < ApplicationRecord
    has_many :houses
    has_many :reservations 
    has_many :guests, through: :reservations

    validates :first_name, :last_name, :phone_number, :email_address, :address, presence: true
    validates :phone_number, :email_address, :address, uniqueness: true
    
    def to_s
        "#{self.first_name} #{self.last_name}"
    end
end
