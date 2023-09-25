require "rails_helper"

RSpec.describe "Mechanics Show Page", type: :feature do
  it "will show the mechanics name and years of experiance" do
    mechanic = Mechanic.create!(name: 'John Doe', years_experience: 5)

    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    mechanic_ride = MechanicRide.create(mechanic: mechanic, ride: hurler)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content("Mechanic: John Doe")
    expect(page).to have_content("Years of Experience: 5")
    expect(page).to have_content("The Hurler")
  end

  it "Displays a form to add a ride" do
    mechanic = Mechanic.create!(name: 'John Doe', years_experience: 5)

    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    mechanic_ride = MechanicRide.create(mechanic: mechanic, ride: hurler)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_selector('form', count: 1)
    expect(page).to have_field('Ride ID')
    expect(page).to have_button('Add Ride')
  end

  it "can add a ride to a mechanic" do
    mechanic = Mechanic.create!(name: 'John Doe', years_experience: 5)

    six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    mechanic_ride = MechanicRide.create(mechanic: mechanic, ride: hurler)

    visit "/mechanics/#{mechanic.id}"

    fill_in 'Ride ID', with: scrambler.id
    click_button 'Add Ride'

    expect(current_path).to eq("/mechanics/#{mechanic.id}")
    expect(page).to have_content(hurler.name)
  end
end