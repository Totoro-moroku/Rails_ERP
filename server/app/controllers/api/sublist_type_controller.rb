module Api
  class SublistTypeController < ApplicationController
    before_action :set_sublist_type, only: [:show, :update, :destroy]

    def index
      posts = SublistType.order(created_at: :desc)
      render json: { status: 'SUCCESS', message: 'Loaded posts', data: @sublist_types }
    end

    def show
      render json: { status: 'SUCCESS', message: 'Loaded the sublist_types', data: @sublist_types }
    end

    def create
      @sublist_types = SublistType.new(sublist_type_params)
      if @sublist_types.save
        render json: { status: 'SUCCESS', data: @sublist_types }
      else
        render json: { status: 'ERROR', data: @sublist_types.errors }
      end
    end

    def destroy
      @sublist_types.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the sublist_types', data: @sublist_types }
    end

    def update
      if @sublist_types.update(sublist_type_params)
        render json: { status: 'SUCCESS', message: 'Updated the sublist_types', data: @sublist_types }
      else
        render json: { status: 'SUCCESS', message: 'Not updated', data: @sublist_types.errors }
      end
    end

    private

    def set_sublist_type
      @sublist_types = SublistType.find(params[:id])
    end

    def sublist_type_params
      params.require(:sublist_types).permit(:name)
    end
  end
end