module Api
  class ItemController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]

    def index
      posts = Transaction.order(created_at: :desc)
      render json: { status: 'SUCCESS', message: 'Loaded posts', data: @transactions }
    end

    def show
      render json: { status: 'SUCCESS', message: 'Loaded the transactions', data: @transactions }
    end

    def create
      @transactions = Transaction.new(transaction_params)
      if @transactions.save
        render json: { status: 'SUCCESS', data: @transactions }
      else
        render json: { status: 'ERROR', data: @transactions.errors }
      end
    end

    def destroy
      @transactions.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the transactions', data: @transactions }
    end

    def update
      if @transactions.update(transaction_params)
        render json: { status: 'SUCCESS', message: 'Updated the transactions', data: @transactions }
      else
        render json: { status: 'SUCCESS', message: 'Not updated', data: @transactions.errors }
      end
    end

    private

    def set_transaction
      @transactions = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transactions).permit(:type_id,:name,:date,:entity_id,:user_id,:memo,:mainline,:item_id,:quantity,:rate,:amount,:line)
    end
  end
end