module Api
  class TransactionTypeController < ApplicationController
    before_action :set_transaction_type, only: [:show, :update, :destroy]

    def index
      posts = TransactionType.order(created_at: :desc)
      render json: { status: 'SUCCESS', message: 'Loaded posts', data: @transaction_types }
    end

    def show
      render json: { status: 'SUCCESS', message: 'Loaded the transaction_types', data: @transaction_types }
    end

    def create
      @transaction_types = TransactionType.new(transaction_type_params)
      if @transaction_types.save
        render json: { status: 'SUCCESS', data: @transaction_types }
      else
        render json: { status: 'ERROR', data: @transaction_types.errors }
      end
    end

    def destroy
      @transaction_types.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the transaction_types', data: @transaction_types }
    end

    def update
      if @transaction_types.update(transaction_type_params)
        render json: { status: 'SUCCESS', message: 'Updated the transaction_types', data: @transaction_types }
      else
        render json: { status: 'SUCCESS', message: 'Not updated', data: @transaction_types.errors }
      end
    end

    private

    def set_transaction_type
      @transaction_types = TransactionType.find(params[:id])
    end

    def transaction_type_params
      params.require(:transaction_types).permit(:name,:created,:creating)
    end
  end
end