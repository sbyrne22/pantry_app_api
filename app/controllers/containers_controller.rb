class ContainersController < ApplicationController
  def index
    containers = Container.all
    render json: containers.to_json(include: :foods)
  end

  def show
    # storage_foods = storage.foods
    container = Container.find(params[:id])
    render json: container.to_json(include: :foods)
  end

  def create
    container = Container.new(container_params)

    if container.save
      render(status: 201, json: {container: container})
    else
      render(status: 422, json: {container: container})
    end
  end

  private

  def container_params
    params.required(:container).permit(:name)
  end
end
