module Api
  class ItemController < ApplicationController
    before_action :set_item, only: [:show, :update, :destroy]

    def index
      posts = Item.order(created_at: :desc)
      render json: { status: 'SUCCESS', message: 'Loaded posts', data: @items }
    end

    def show
      render json: { status: 'SUCCESS', message: 'Loaded the items', data: @items }
    end

    def create
      @items = Item.new(item_params)
      if @items.save
        render json: { status: 'SUCCESS', data: @items }
      else
        render json: { status: 'ERROR', data: @items.errors }
      end
    end

    def destroy
      @items.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the items', data: @items }
    end

    def update
      if @items.update(item_params)
        render json: { status: 'SUCCESS', message: 'Updated the items', data: @items }
      else
        render json: { status: 'SUCCESS', message: 'Not updated', data: @items.errors }
      end
    end

    private

    def set_item
      @items = Item.find(params[:id])
    end

    def item_params
      params.require(:items).permit(:name,:origin_rate)
    end
  end
end