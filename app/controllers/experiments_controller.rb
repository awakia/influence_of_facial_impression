class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.includes(:user).order("user_id, face, share").all
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    update_params = params[:experiment]
    update_params[:accept] = true if params[:commit][0] == 'A'  # Accept
    update_params[:accept] = false if params[:commit][0] == 'R'  # Reject
    @experiment.update_attributes!(update_params)
    next_exp = Experiment.where(user_id: @experiment.user_id, accept: nil).order(:id).first
    if next_exp
      redirect_to experiment_path(next_exp)
    else
      redirect_to @experiment.user  # TODO: redirect to "Thank you" page
    end
  end
end
