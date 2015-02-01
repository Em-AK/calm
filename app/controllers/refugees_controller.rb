class RefugeesController < ApplicationController
  before_action :get_refugee, only: [:show, :edit, :update, :confirm, :unconfirm]
  before_action :clear_scopes_and_auth_refugee!, only: [:profile, :edit, :update]
  before_action :clear_scopes_and_auth_mediator!, only: [:index, :show, :confirm, :unconfirm]

  def index
    @refugees = current_mediator.refugees
  end

  def profile
    @refugee = current_refugee
    @homes = Home.all
    if @refugee.mediator_id
      @mediator = Mediator.find(@refugee.mediator_id)
    end
  end

  def show
  end

  def edit
    redirect_to profile_path unless current_refugee == @refugee
  end

  def update
    redirect_to profile_path unless current_refugee == @refugee
    if @refugee.update(refugee_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def confirm
    set_confirmed(true)
    redirect_to action: :index
  end

  def unconfirm
    set_confirmed(false)
    redirect_to action: :index
  end

  def add_mediator
    @mediator = Mediator.find_by(email: params[:mediator_email])
    if @mediator
      @mediator.refugees << current_refugee
      redirect_to profile_path
    else
      redirect_to profile_path, alert: t(:mediator_not_found)
    end
  end

  private

  def refugee_params
    params.require(:refugee).permit(:firstname, :name, :birthday, :nationality, :description)
  end

  def get_refugee
    @refugee = Refugee.find(params[:id])
  end

  def set_confirmed(value)
    if current_mediator.refugees.include? @refugee
      @refugee.update(confirmed: value)
    end
  end


end
