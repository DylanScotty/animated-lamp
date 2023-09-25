require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides)}
  end
end