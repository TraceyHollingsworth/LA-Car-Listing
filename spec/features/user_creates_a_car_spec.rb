require 'rails_helper'

feature "List a Car", %q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:
  [ ] I must specify the manufacturer, color, year, and mileage of the car
      (an association between the car and an existing manufacturer should be created).
  [ ] Only years from 1920 and above can be specified.
  [ ] I can optionally specify a description of the car.
  [ ] If I enter all of the required information in the required formats,
      the car is recorded and I am presented with a notification of success.
  [ ] If I do not specify all of the required information in the required formats,
      the car is not recorded and I am presented with errors.
  [ ] Upon successfully creating a car, I am redirected back to the index of cars.

) do

  before :each do
    Manufacturer.create(name: "Mazda", country: "Japan")
  end

  scenario "user submits a valid car" do
    visit manufacturer_path(manufacturer)

    select "Manufacturer", with: "Mazda"
    fill_in "Color", with: "Black"
    fill_in "Year", with: "2000"
    fill_in "Mileage", with: "132000"
    # fill_in "Description", with: "Rest assured, once you take this Mazda Protege home you will know you've made a solid investment."
    click_button "Create New Car Listing"

    expect(page).to have_content("New Car Listing Created!")
  end

  scenario "user submits empty form" do
    # visit manufacturer_path(manufacturer)

    # click_button "Create New Car Listing"

    # expect(page).to have_content("Color can't be blank")
    # expect(page).to have_content("Mileage can't be blank")
    # expect(page).to have_content("Year is not a number")
    # expect(page).to have_content("Year can't be blank")
  end
end

