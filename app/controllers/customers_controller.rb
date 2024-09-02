class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer, only: [:show, :edit, :update, :destroy]
  def index
    @customers = Customer.order(:name)
    authorize @customers
  end

  def search
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true)
  end

  def show
    authorize @customer
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new customer_params
    authorize @customer
    if @customer.save
      redirect_to customers_path, notice: 'Cliente cadastrado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    authorize @customer
  end
  def update
    authorize @customer
    if @customer.update customer_params
      redirect_to customers_path, notice: 'Cliente atualizado com sucesso!'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    authorize @customer
    @customer.destroy
    redirect_to customers_path
  end

  private

  def load_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :dob, :email, :mobile_phone)
  end
end
