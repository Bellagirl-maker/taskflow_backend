class Api::ListsController < ApplicationController
    def index
        render json: List.all, include: :tasks
    end
    def show
        lists= List.find(params[:id])
        render json: Lists, include: :tasks
    end
    def create
      list = List.new(list_params)
      if list.save
        render json: list, status: :created
      else
        render json: list.errors, status: :unprocessable_entity
      end
    end

  def update
      list = List.find(params[:id])
      if list.update(list_params)
        render json: list
      else
         render json: list.errors, status: :unprocessable_entity
      end
    end

    def destroy
      list = List.find(params[:id])
      list.destroy
      head :no_content
    end

    private

    def list_params
      params.require(:list).permit(:title)
    end
end

