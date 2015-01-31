class RefugeesController < ApplicationController
  before_action :get_refugee, only: [:show, :edit, :update]

  def index
    Refugee.all
  end

  def show
  end

  def new
    @refugee = Refugee.new
  end

  def create
    @refugee = Refugee.new(refugee_params)
    if @refugee.save
      redirect_to @refugee
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @refugee.update(refugee_params)
      redirect_to @refugee
    else
      render :edit
    end
  end

  private

  def refugee_params
    params.require(:refugee).permit(:firstname, :name, :birthday, :nationality, :email, :description)
  end

  def get_refugee
    @refugee = Refugee.find(params[:id])
  end
end
