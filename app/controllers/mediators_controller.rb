class MediatorsController < ApplicationController
  def edit
    @mediator = Mediator.find(params[:id])
  end

  def update
    @mediator = Mediator.find(params[:id])
    if @mediator.update(mediator_params)
      redirect_to refugees_path
    else
      render :edit
    end
  end

  private

  def mediator_params
    params.require(:mediator).permit(:name, :firstname)
  end

end
