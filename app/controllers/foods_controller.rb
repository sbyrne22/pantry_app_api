class FoodsController < ApplicationController
  def index
    foods = Food.all
    render json: {status: 200, foods: foods}
  end

  # Filtered Routes
  def fridge
    foods = Food.where(storage_id: 1)
    render json: {status: 200, foods: foods}
  end
  def freezer
    foods = Food.where(storage_id: 2)
    render json: {status: 200, foods: foods}
  end
  def pantry
    foods = Food.where(storage_id: 3)
    render json: {status: 200, foods: foods}
  end
  def box
    foods = Food.where(container_id: 1)
    render json: {status: 200, foods: foods}
  end
  def can
    foods = Food.where(container_id: 2)
    render json: {status: 200, foods: foods}
  end
  def bag
    foods = Food.where(container_id: 3)
    render json: {status: 200, foods: foods}
  end
  # End Filtered Routes

  def show
    food = Food.find(params[:id])
    render json: {status: 200, food: food}
  end

  def create
    food = Food.new(food_params)
    food.storage_id = params[:storage_id]
    food.container_id = params[:container_id]
    food.user_id = params[:user_id]

    if food.save
      render(status: 201, json: {food: food})
      # render json: food, status: :created, storage: food.storage_id, container: food.container_id
    else
      render json: food.errors, status: :unprocessable_entity
    end
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    render(status: 200, json: {food: food})
  end

  def destroy
    food = Food.destroy(params[:id])
    render(status: 204)
  end

  private

  def food_params
    params.required(:food).permit(:name, :purchased_date, :experation_date, :storage_id, :container_id, :user_id)
  end
end
