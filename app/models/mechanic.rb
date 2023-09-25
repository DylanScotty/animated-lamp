class Mechanic < ApplicationRecord
    has_many :mechanic_rides
    has_many :rides, through: :mechanic_rides
end