class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def unique_mechanics
    mechanics.distinct
  end

end