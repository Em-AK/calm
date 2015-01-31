class RefugeesController < ApplicationController
  before_action :get_refugee, only: [:show, :edit, :update]
  before_action :authenticate_refugee!, only: [:profile, :edit, :update]
  before_action :authenticate_mediator!, only: [:index, :show]

  def index
    @refugees = current_mediator.refugees
  end

  def profile
  end

  def show
  end

  def edit
  end

  def update
    if @refugee.update(refugee_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def refugee_params
    params.require(:refugee).permit(:firstname, :name, :birthday, :nationality, :description)
  end

  def get_refugee
    @refugee = Refugee.find(params[:id])
  end
end
