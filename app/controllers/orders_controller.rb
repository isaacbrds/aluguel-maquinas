class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    if @order.save
      redirect_to orders_path, notice: "Pedido realizado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:equipament_id, :customer_id, :period_start, :period_end)
  end
end
