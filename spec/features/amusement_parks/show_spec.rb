require "rails_helper"

RSpec.describe "Amusement Park Show Page", type: :feature do
  it "will show the Amusement Park name and admission" do
    mechanic = Mechanic.create!(name: 'John Doe', years_experience: 5)

    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    mechanic_ride = MechanicRide.create(mechanic: mechanic, ride: hurler)
    mechanic_ride1 = MechanicRide.create(mechanic: mechanic, ride: scrambler)

    visit "/amusement_parks/#{six_flags.id}"

    expect(page).to have_content(six_flags.name)
    expect(page).to have_content(six_flags.admission_cost)
    expect(page).to have_content("Mechanics that work here:")
    within("#mechanic-#{mechanic.id}") do
    expect(page).to have_content(mechanic.name)
    end
  end
end