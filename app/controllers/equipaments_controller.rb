class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_equipament, only: [:edit, :update, :destroy, :show]

  def index
    @equipaments = Equipament.order(name: :asc)
    authorize(@equipaments)
  end

  def new
    @equipament = Equipament.new
    authorize @equipament
  end

  def search
    @q = Equipament.ransack(name_matches: params[:q])
    @equipaments = @q.result(distinct: true)

    render layout: false
  end

  def create
    @equipament = Equipament.new equipament_params
    authorize @equipament
    if @equipament.save
      redirect_to equipaments_path, notice: 'Equipamento cadastrado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @equipament
  end

  def update
    if @equipament.update equipament_params
      redirect_to equipaments_path, notice: 'Equipamento atualizado com sucesso!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    authorize @equipament
  end

  def destroy
    authorize @equipament
    @equipament.destroy
    redirect_to equipaments_path
  end

  private

  def load_equipament
    @equipament = Equipament.find params[:id]
  end

  def equipament_params
    params.require(:equipament).permit( :name, :description, :serial_number)
  end
end
