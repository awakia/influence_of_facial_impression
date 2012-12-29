class ExperimentsController < ApplicationController
  def show
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    @experiment.update_attributes!(params[:experiment])
    next_exp = Experiment.where(user_id: @experiment.user_id, accept: nil).first
    if next_exp
      redirect_to experiment_path(next_exp)
    else
      redirect_to @experiment.user  # TODO: redirect to "Thank you" page
    end
  end
end
