require 'rails_helper'

feature "Create a Manufacturer", %q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:
  [X] I must specify a manufacturer name and country.
  [X] If I do not specify the required information, I am presented with errors.
  [X] If I specify the required information,
      the manufacturer is recorded and
      I am redirected to the index of manufacturers.
  [X] If a manufacturer already exists in the database, I am given an error.

) do

  before(:each) do
    visit new_manufacturer_path
  end

  scenario "user inputs a manufacturer" do
    fill_in "Name", with: "Mazda"
    fill_in "Country", with: "Japan"
    click_button "Create Manufacturer"

    expect(page).to have_content("New Manufacturer Created!")
    expect(current_path).to eq(manufacturers_path)
  end

  scenario "user is given errors if they forget fields" do
    click_button "Create Manufacturer"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Country can't be blank")
    expect(current_path).to eq(manufacturers_path)
  end

  scenario "user enters duplicate manufacturer" do
    manufacturer = Manufacturer.create(
      name: "Mazda",
      country: "Japan"
    )

    fill_in "Name", with: "Mazda"
    fill_in "Country", with: "Japan"
    click_button "Create Manufacturer"

    expect(page).to have_content("Name has already been taken")
  end
end

