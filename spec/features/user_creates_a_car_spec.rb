require 'rails_helper'

feature "Create a Car", %q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:
  [ ] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an e isting manufacturer should be created).
  [ ] Only years from 1920 and above can be specified.
  [ ] I can optionally specify a description of the car.
  [ ] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
  [ ] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  [ ] Upon successfully creating a car, I am redirected back to the index of cars.

) do

  scenario "user inputs a car" do

  end
end

