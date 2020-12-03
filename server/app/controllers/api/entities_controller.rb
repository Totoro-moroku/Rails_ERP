module Api
  class EntityController < ApplicationController
    before_action :set_entity, only: [:show, :update, :destroy]

    def index
      posts = Entity.order(created_at: :desc)
      render json: { status: 'SUCCESS', message: 'Loaded posts', data: @entities }
    end

    def show
      render json: { status: 'SUCCESS', message: 'Loaded the entities', data: @entities }
    end

    def create
      @entities = Entity.new(entity_params)
      if @entities.save
        render json: { status: 'SUCCESS', data: @entities }
      else
        render json: { status: 'ERROR', data: @entities.errors }
      end
    end

    def destroy
      @entities.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the entities', data: @entities }
    end

    def update
      if @entities.update(entity_params)
        render json: { status: 'SUCCESS', message: 'Updated the entities', data: @entities }
      else
        render json: { status: 'SUCCESS', message: 'Not updated', data: @entities.errors }
      end
    end

    private

    def set_entity
      @entities = Entity.find(params[:id])
    end

    def entity_params
      params.require(:entities).permit(:company_name)
    end
  end
end