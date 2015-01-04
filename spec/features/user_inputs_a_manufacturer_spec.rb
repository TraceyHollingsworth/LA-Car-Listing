require 'rails_helper'

feature "Input a Manufacturer", %q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:
  [ ] I must specify a manufacturer name and country.
  [ ] If I do not specify the required information, I am presented with errors.
  [ ] If I specify the required information,
      the manufacturer is recorded and
      I am redirected to the index of manufacturers.

) do

  scenario "user inputs a manufacturer" do
    visit new_manufacturer_path
    fill_in "Name", with: "Mazda"
    fill_in "Country", with: "Japan"
    click_on "Create Manufacturer"
    expect(page).to have_content("Created successfully!")
  end

end

