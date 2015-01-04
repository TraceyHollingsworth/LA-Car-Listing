class ManufacturersController < ApplicationController

  def new
    @manufacturer = Manufacturer.new
  end

end
