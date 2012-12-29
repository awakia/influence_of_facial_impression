class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    Experiment.generate_set(@user)

    redirect_to experiment_path(@user.experiments.first), notice: 'User was successfully created.'
  end
end
