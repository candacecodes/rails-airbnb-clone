class Reservation < ApplicationRecord
    belongs_to :guest
    belongs_to :house 
    has_many :messages 
end
