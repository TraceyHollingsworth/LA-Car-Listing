class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all
  end

  def create
    @car = Car.create(car_params)
    @manufacturers = Manufacturer.all

    if @car.save
      redirect_to cars_path, notice: "New Car Added!"
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color,
      :year, :mileage, :description
    )
  end
end
