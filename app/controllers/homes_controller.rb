class HomesController < ApplicationController
  before_action :clear_scopes_and_auth_host!, only: [:new, :create, :edit, :update]
  before_action :get_home, only: [:edit, :update, :show]

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    if current_host.home = @home
      redirect_to home_path(@home)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @home.update(home_params)
      redirect_to home_path(@home)
    else
      render :edit
    end
  end

  def show
  end

  def index
  end

  private

  def home_params
    params.require(:home).permit(:max_guests, :location, :description)
  end

  def get_home
    @home = Home.find(params[:id])
  end
end
