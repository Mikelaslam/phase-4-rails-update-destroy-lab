class PlantsController < ApplicationController
  # GET /plants
  def index
    @plants = Plant.all
    render json: @plants
  end

  # GET /plants/:id
  def show
    @plant = Plant.find(params[:id])
    render json: @plant
  end

  # POST /plants
  def create
    @plant = Plant.new(plant_params)

    if @plant.save
      render json: @plant, status: :created
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  # PATCH /plants/:id
  def update
    @plant = Plant.find(params[:id])

    if @plant.update(plant_params)
      render json: @plant
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plants/:id
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    head :no_content
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end

