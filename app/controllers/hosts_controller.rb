class HostsController < ApplicationController
  before_action :clear_scopes_and_auth_host!

  def dashboard
  end

  def edit
    @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    if @host.update(host_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def host_params
    params.require(:host).permit(:name, :firstname, :bio)
  end
end
