class StoragesController < ApplicationController
  def index
    storages = Storage.all
    render json: storages.to_json(include: :foods)
  end

  def show
    # storage_foods = storage.foods
    storage = Storage.find(params[:id])
    render json: storage.to_json(include: :foods)
  end

  def create
    storage = Storage.new(storage_params)

    if storage.save
      render(status: 201, json: {storage: storage})
    else
      render(status: 422, json: {storage: storage})
    end
  end

  private

  def storage_params
    params.required(:storage).permit(:name)
  end
end
