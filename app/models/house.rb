class House < ApplicationRecord
    belongs_to :host 
    has_many :reservations
    has_many :guests, through: :reservations

    validates :address, :bedrooms, :bathrooms, :parking, :guest_limit, :house_type, :host_id, :cost_per_day, presence: true
    validates :address, uniqueness: true
end
